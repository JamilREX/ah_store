import 'package:ah_store/components/cart_card.dart';
import 'package:ah_store/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // Get.lazyPut(()=>CartController());

    print('ccc = ${Get.currentRoute}');
    return GetBuilder<CartController>(
      builder:(controller)=> Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.finalPrice.toString()),
              ],
            )
          ],
          title: const Text('Cart'),
          backgroundColor: Colors.purple,
        ),
        body: Stack(
          children: [

            Positioned(
              top: 0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx((){
                      return controller.cartModel.value.orderItems.isNotEmpty?SizedBox(
                        width: Get.width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.cartModel.value.orderItems.length,
                          itemBuilder: (context , index){
                            return CartCard(orderItem: controller.cartModel.value.orderItems[index]);
                          },
                        ),
                      ):SizedBox();
                      // var widget;
                      // controller.cartModel.value.orderItems!=null && controller.cartModel.value.orderItems!.isNotEmpty?widget=Expanded(child: ListView.builder(
                      //   shrinkWrap: true,
                      //   itemCount: controller.cartModel.value.orderItems!.length,
                      //   itemBuilder: (context , index){
                      //     return Text(controller.cartModel.value.orderItems![index].productId.toString());
                      //   },
                      // )):widget=SizedBox();
                      // return widget;
                    }),
                  ],
                ),
              ),

            ),
            Positioned(
              bottom: 16,
              child: SizedBox(
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NeumorphicButton(
                      onPressed: (){
                      },
                      child: Text('buy'),
                    ),
                  ],
                ),
              )
            ),
            // SingleChildScrollView(
            //   child: Column(
            //     children: [
            //       Text('kkk')
            //     ],
            //   ),
            // ),

          ],
        ),
      ),
    );
  }
}
