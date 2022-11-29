import 'dart:io';

import 'package:ah_store/const/consts.dart';
import 'package:ah_store/controller/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../controller/home_controller.dart';
import '../models/all_model_req.dart';

class ProductDetailsView extends StatelessWidget {
  final Products product;

  const ProductDetailsView({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsController());
    return GetBuilder<ProductDetailsController>(
      builder:(controller)=> Scaffold(
        body: Stack(
          children: [
            Positioned(
                bottom: 10,
                child: SizedBox(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Get.width * 0.9,
                        child: NeumorphicButton(
                          onPressed: (){
                            controller.addProductToCartView(product);
                          },
                          child: Row(
                            children: [
                              Text('Add to cart'),
                              SizedBox(width: 30),
                              Icon(Icons.shopping_cart_outlined)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Column(
              children: [
                Image.network(
                  KConstants.domain + product.photo.toString(),
                  width: Get.width,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: Get.width,
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
                          for (FullCategory item
                              in Get.find<HomeController>().categoryModelList) {
                            if (item.id == product.categoryId) {
                              for (Products x in item.products!) {
                                if (x.id == product.id) {
                                  favouriteCount = x.favoriteCount!;
                                }
                              }
                            }
                          }
                          print(favouriteCount.toString());

                          return Get.find<HomeController>().favLoading.value ==
                                      true &&
                                  Get.find<HomeController>()
                                          .productChanging
                                          .value ==
                                      product.id.toString()
                              ? SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.red,
                                  ),
                                )
                              : favouriteCount == 0
                                  ? Icon(
                                      Icons.favorite_outline,
                                      color: Colors.blueGrey,
                                      size: 32,
                                    )
                                  : Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 32,
                                    );
                        }),
                      ),
                      SizedBox(width: 30),
                      InkWell(
                          onTap: () async {
                            final response = await http.get(Uri.parse(
                                KConstants.domain + product.photo.toString()));
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
                            size: 32,
                          )),
                    ],
                  ),
                ),
                // todo price
                //todo name
                // todo description
              ],
            ),
          ],
        ),
      ),
    );
  }
}
