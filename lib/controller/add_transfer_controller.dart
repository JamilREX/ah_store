


import 'package:ah_store/const/consts.dart';
import 'package:ah_store/controller/global_controller.dart';
import 'package:ah_store/controller/home_controller.dart';
import 'package:ah_store/helper/request_helper.dart';
import 'package:ah_store/models/all_model_req.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddTransferController extends GetxController {


  List<TransferWay> transfersList = [];


  TextEditingController amountController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  TransferWay selectedTransferWay = TransferWay();




  addTransfer()async{
    if(amountController.text=='' || fullNameController.text=='' || locationController.text =='' || phoneNumberController.text == ''){
      //todo add error snack bar
    }else{
      var response = await RequestHelper.post(url: '${KConstants.domain}api/transfer/order/add', body: {
        'amount' : amountController.text,
        'detail' : '${fullNameController.text}\n${locationController.text}\n${phoneNumberController.text}',
        'way' : selectedTransferWay.name,
      });
      if(response.statusCode==201){
        Get.back();
        //todo need to edit
        Get.snackbar('done', 'done');
      }else{
        Get.snackbar('error', response.body['msg']);
      }
    }
  }





  @override
  void onInit() {
    transfersList = Get.find<HomeController>().allModel.transferWay!;
    super.onInit();
  }



}