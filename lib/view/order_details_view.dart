

import 'package:ah_store/components/order_log_tile.dart';
import 'package:ah_store/controller/order_details_controller.dart';
import 'package:ah_store/models/all_model_req.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/order_log_model.dart';

class OrderDetailsView extends StatelessWidget {
  String id;
   OrderDetailsView({Key? key , required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return GetBuilder<OrderDetailsController>(
        initState: (_){
          Get.find<OrderDetailsController>().getOrderDetails(id);
        },

        builder: (controller)=>Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Order Details'),
            backgroundColor: Colors.purple,
          ),
          body: SingleChildScrollView(
            child: Obx(() => controller.loading.value==true?Center(child: CircularProgressIndicator()):Column(
              children: [

                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  color: Colors.blueGrey,
                  child: Column(
                    children: [
                      Row(children: [
                        Text("order number ID"),
                       // Text(orderModel.productId.toString())
                      ],),
                      Column(
                        children: controller.data.entries.map((e) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text(e.key),
                          const SizedBox(width: 10),
                          Text(e.value),
                        ],)).toList()
                      )
                    ],
                  ),
                )



                // Text(controller.orderDetails.productId.toString()),
                // Column(
                //   children: controller.data.entries.map((e) => Row(children: [
                //     Text(e.key),
                //     const SizedBox(width: 10),
                //     Text(e.value),
                //   ],)).toList()
                // )
              ],
            ))
          ),
    ));
  }
}
