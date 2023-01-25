

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
            title: Text('Order Details # ${id.toString()}'),
            backgroundColor: Colors.purple,
          ),
          body: SingleChildScrollView(
            child: Obx(() => controller.loading.value==true?Center(child: CircularProgressIndicator()):Column(
              children: [

                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                 // color: Colors.blueGrey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.purple,
                        ),
                        child: Column(
                          children: controller.data.entries.map((e) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text(e.key , style: const TextStyle(color: Colors.white),),
                            const SizedBox(width: 10),
                            Text(e.value , style: const TextStyle(color: Colors.white),),
                          ],)).toList()
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(controller.orderDetails.price.toString()),
                      Text(controller.orderDetails.createdAt.toString()),
                    ],
                  ),
                )
              ],
            ))
          ),
    ));
  }
}
