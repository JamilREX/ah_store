

import 'package:ah_store/components/favourit_card.dart';
import 'package:ah_store/const/consts.dart';
import 'package:ah_store/controller/cart_controller.dart';
import 'package:ah_store/controller/category_content_controller.dart';
import 'package:ah_store/controller/favourit_controller.dart';
import 'package:ah_store/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/cart_card.dart';

class FavouritView extends StatelessWidget {
  const FavouritView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouritController>(
        builder:(controller)=> Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favourites Category'),
        backgroundColor: Colors.purple,
      ),
      body:
           SingleChildScrollView(
              child: Column(
                children: [
              controller.modelProduct.value.products!.isNotEmpty?SizedBox(
                  width: Get.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:  controller.modelProduct.value.products!.length,
                    itemBuilder: (context , index){
                      return FavouritCard(product: controller.modelProduct.value.products![index]);
                    },
                  ),
              ):SizedBox(),
                  ]
    )
            )


    ));

  }
}
