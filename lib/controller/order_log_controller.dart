

import 'package:ah_store/const/consts.dart';
import 'package:ah_store/helper/request_helper.dart';
import 'package:get/get.dart';

import '../models/order_log_model.dart';

class OrderLogController extends GetxController {

  List<OrderModel> ordersList = [];

  getOrdersList()async{
    ordersList = [];
    var response = await RequestHelper.get(url: KConstants.domain + 'api/order/all');
    if(response.statusCode==200){
      print(response.body);
      ordersList = OrderLogReq.fromJson(response.body).ordersList!;
    }
    update();
  }


}