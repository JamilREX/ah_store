import 'package:ah_store/models/order_log_model.dart';
import 'package:ah_store/view/order_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class OrderLogTile extends StatelessWidget {

  final OrderModel orderModel;
  const OrderLogTile({Key? key , required this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: NeumorphicStyle(
        color: Colors.white
      ),
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      onPressed: (){
        Get.to(OrderDetailsView(id: orderModel.id.toString()));
      },
      child:
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                      radius: 30,
                      foregroundImage:AssetImage('assets/images/e.png') ),
                  Text(orderModel.productName.toString()),
                  Container(
                    decoration: BoxDecoration(
                      color: orderModel.accept==0?Colors.orange:orderModel.accept==1?Colors.green:Colors.red,
                    ),
                    child: Text(orderModel.accept==0?'waiting':orderModel.accept==1?'accepted':'rejected' , style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(orderModel.createdAt.toString()),
                ],
              ),
             // Text(orderModel.productId.toString()),
             //
            //  Text(orderModel.price.toString()),
             // Text(orderModel.quantity.toString()),
             //

            ],
          )
    );
  }
}
