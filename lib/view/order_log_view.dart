import 'package:ah_store/components/order_log_tile.dart';
import 'package:ah_store/controller/global_controller.dart';
import 'package:ah_store/controller/order_log_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrderLogView extends StatelessWidget {
  const OrderLogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderLogController());
    return GetBuilder<OrderLogController>(

        initState: (_){
          Get.find<OrderLogController>().getOrdersList();
        },
        builder: (controller)=>Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Order Log'),
        backgroundColor: Colors.purple,
      ),
      body: controller.ordersList.isNotEmpty?ListView.builder(
        itemCount: controller.ordersList.length,
        itemBuilder: (context , index){
          return OrderLogTile(orderModel: controller.ordersList[index]);
        },

      ):SizedBox(),
    ));
  }
}
