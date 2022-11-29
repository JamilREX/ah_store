import 'dart:io';
import 'package:ah_store/const/consts.dart';
import 'package:ah_store/controller/home_controller.dart';
import 'package:ah_store/models/all_model_req.dart';
import 'package:ah_store/view/product_detail_view.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

class ProductCard extends StatelessWidget {
  final Products product;
  final int categoryIndex;
  final int productIndex;

  const ProductCard(
      {Key? key,
      required this.product,
      required this.categoryIndex,
      required this.productIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(ProductDetailsView(product: product,));
      },
      child: SizedBox(
        height: Get.width * 0.45,
        // width: Get.width*0.99,
        child: Neumorphic(
          style: NeumorphicStyle(
            color: Colors.white,
            intensity: 0.5,
            depth: 3,
          ),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.max,
            children: [
              Image.network(
                KConstants.domain + product.photo.toString(),
                width: Get.width * 0.45,
                height: Get.width * 0.45,
                fit: BoxFit.fitHeight,
              ),
              Padding(
                padding: const EdgeInsets.all(11),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text(product.productName.toString())

                    SizedBox(
                      width: Get.width * 0.43,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text('laptop DDR5 Ram 3200 mhz',
                                style: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\$ ${product.price.toString()}',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade800),
                    ),
                    Expanded(
                        child: SizedBox(
                      height: 10,
                    )),
                    SizedBox(
                      width: Get.width * 0.43,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.find<HomeController>()
                                  .changeFavourite(product.id.toString());
                            },
                            child: Obx(() {
                              int favouriteCount = 0;
                              for (FullCategory item in Get.find<HomeController>()
                                  .categoryModelList) {
                                if (item.id == product.categoryId) {
                                  for (Products x in item.products!) {
                                    if (x.id == product.id) {
                                      favouriteCount = x.favoriteCount!;
                                    }
                                  }
                                }
                              }
                              print(favouriteCount.toString());

                              return Get.find<HomeController>()
                                              .favLoading
                                              .value ==
                                          true &&
                                      Get.find<HomeController>()
                                              .productChanging
                                              .value ==
                                          product.id.toString()
                                  ? SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.red,
                                      ),
                                    )
                                  : favouriteCount == 0
                                      ? Icon(
                                          Icons.favorite_outline,
                                          color: Colors.blueGrey,
                                        )
                                      : Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        );
                            }),
                          ),
                          SizedBox(width: 12),
                          InkWell(
                              onTap: () async {
                                final response = await http.get(Uri.parse(
                                    KConstants.domain +
                                        product.photo.toString()));
                                final documentDirectory =
                                    await getTemporaryDirectory();
                                final file =
                                    File('${documentDirectory.path}/temp.jpg');
                                file.writeAsBytesSync(response.bodyBytes);
                                print(file.path);
                                XFile xfile = XFile(file.path);
                                print(xfile.path);
                                Share.shareXFiles([xfile],
                                    text:
                                        '${product.productName}\nprice:${product.price}\nhttps://www.google.com');
                              },
                              child: Icon(
                                Icons.share_outlined,
                                color: Colors.blueGrey,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
