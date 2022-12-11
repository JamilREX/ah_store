import 'package:ah_store/controller/favourite_controller.dart';
import 'package:ah_store/view/product_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../const/consts.dart';


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
              return NeumorphicButton(
                style: NeumorphicStyle(

                color: Colors.white,
                  depth: 6,
                  intensity: 0.6,
              ),
                  onPressed: () {
                    Get.to(ProductDetailsView(product: controller.favProducts.value[index]));
                  },
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: EdgeInsets.all(0),
                  child:Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: Get.width,
                    margin: EdgeInsets.all(6),
                    child: Row(
                      children: [
                        Container(
                          width: Get.width * 0.2,
                          child: CircleAvatar(
                            radius: 50,
                            foregroundImage: NetworkImage(KConstants.domain +
                               controller.favProducts.value[index].photo.toString()),
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Container(
                          width: Get.width * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                 controller.favProducts.value[index].productName.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(
                                height: 5,
                              ),
                               Text(controller.favProducts.value[index].description.toString(),style: TextStyle(fontSize: 7),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: Get.width * 0.2,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Icon(Icons.more_horiz,size: 30,color: Colors.purple,),
                             SizedBox(width: 5,)
                           ],
                         ),
                        ),
                      ],
                    ),
                  ),
                );
              //Text(controller.favProducts.value[index].productName.toString());
            },
          ):SizedBox(),
        )));
  }
}
