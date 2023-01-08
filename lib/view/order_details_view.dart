

import 'package:ah_store/controller/order_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                Text(controller.orderDetails.productId.toString()),
                Column(
                  children: controller.data.entries.map((e) => Row(children: [
                    Text(e.key),
                    const SizedBox(width: 10),
                    Text(e.value),
                  ],)).toList()
                )
              ],
            ))
          ),
    ));
  }
}
