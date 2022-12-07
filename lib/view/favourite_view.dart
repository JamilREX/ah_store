import 'package:ah_store/controller/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class FavouriteView extends StatelessWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FavouriteController());
    return GetBuilder<FavouriteController>(
      initState: (_){
       Get.find<FavouriteController>().getFavProductsLocally();
      },
        builder: (controller)=>Obx(() => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Favourite'),
            backgroundColor: Colors.purple,
          ),
          body: controller.favProducts.value.isNotEmpty?ListView.builder(
            itemCount: controller.favProducts.length,
            itemBuilder: (context , index){
              return Text(controller.favProducts.value[index].productName.toString());
            },
          ):SizedBox(),
        )));
  }
}
