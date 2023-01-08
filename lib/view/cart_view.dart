import 'package:ah_store/components/cart_card.dart';
import 'package:ah_store/controller/cart_controller.dart';
import 'package:ah_store/view/buy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.put(CartController());


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
          fit: StackFit.expand,
          children: [
            Positioned(

              child: SingleChildScrollView(
                child: Column(
                  children: [


                    Obx((){
                      print('jj : ${controller.cartModel.value.orderItems.length}');
                      return controller.cartModel.value.orderItems.isNotEmpty?SizedBox(
                        width: Get.width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          //physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.cartModel.value.orderItems.length,
                          itemBuilder: (context , index){
                            return CartCard(orderItem: controller.cartModel.value.orderItems[index]);
                          },
                        ),
                      ):SizedBox();
                    }),
                  ],
                ),
              ),

            ),
            controller.cartModel.value.orderItems.isNotEmpty?Positioned(
              bottom: 0,
              child: SizedBox(
                 width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width*0.5,
                      child: NeumorphicButton(
                        style: NeumorphicStyle(color: Colors.purple),
                        onPressed: (){


                          Get.dialog(BuyDialog());







                         // controller.buy();
                          // var x = double.parse(Get.find<GlobalController>().userModel.value.balance.toString());
                          // var y= double.parse(Get.find<CartController>().finalPrice.toString());
                          // if(x >= y){
                          //   controller.buy();
                          //   Get.snackbar("Success", "you purchase has been made ,we will contact you shortly !",backgroundColor: Color(0xff00ff00));
                          // }
                          // else{Get.snackbar("NO", "no balance",backgroundColor: Color(0xffff0000));}

                        },
                            child: Text('buy',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)),
                    ),
                  ],
                ),
              )
            ):SizedBox(),
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
