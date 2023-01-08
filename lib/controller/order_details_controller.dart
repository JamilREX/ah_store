

import 'dart:convert';

import 'package:ah_store/const/consts.dart';
import 'package:ah_store/helper/request_helper.dart';
import 'package:ah_store/models/order_details_model.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {

  var loading  = false.obs;

  OrderDetails orderDetails = OrderDetails();
  Map<String , dynamic> data = {};

  
  getOrderDetails(String id)async{
    loading.value = true;
    var response = await RequestHelper.get(url: '${KConstants.domain}api/order/get/$id');
    print(response.body);
    if(response.statusCode==200){
      orderDetails = OrderDetailsReq.fromJson(response.body).orderDetails!;
      data = jsonDecode(orderDetails.data!);
    }
    update();
    loading.value=false;
  }






}