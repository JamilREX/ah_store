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
        builder: (controller) => Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('product details'),
              backgroundColor: Colors.purple,
            ),
            body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //todo prodect description
                      Text(
                        "Xiaomi Redmi 10C 4G",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                          "And Pile Xiaomi Redmi 10C 4G network (graphite gray, "
                          "4 GB RAM, 64 GB storage, screen with a clear fingerprint"
                          " location| 50 MP with 5 MP rear camera",
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Image.network(
                          KConstants.domain + product.photo.toString(),
                          width: Get.width,
                        ),
                      ),

                      //*******************************//
                      SizedBox(
                        height: 10,
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
                                    in Get.find<HomeController>()
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
                                      KConstants.domain +
                                          product.photo.toString()));
                                  final documentDirectory =
                                      await getTemporaryDirectory();
                                  final file = File(
                                      '${documentDirectory.path}/temp.jpg');
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
                      SizedBox(
                        height: 15,
                      ),
                      //******************************//
                      Container(
                        width: Get.width,
                        height: 3,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "\$" + product.price.toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),

                      Text(
                        "Discount 3% for the customer who purchases more than one product",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "see trems here",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text("The product is shipped from outside the Syrian Arab Republic",style: TextStyle(color: Colors.grey),),
                      SizedBox(height: 20,),
                      NeumorphicButton(
                          onPressed: () {
                            controller.addProductToCartView(product);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Text('Add to cart',),
                            SizedBox(width: 30),
                           // Icon(Icons.shopping_cart_outlined)
                          ])),
                      SizedBox(height: 10,),
                      NeumorphicButton(
                        style: NeumorphicStyle(color: Colors.purple),
                          onPressed: () {
                            controller.addProductToCartView(product);
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Text('Buy now',style: TextStyle(color: Colors.white),),

                            SizedBox(width: 30),
                            //Icon(Icons.shopping_cart_outlined)
                          ]))
                    ]))));
  }
}
