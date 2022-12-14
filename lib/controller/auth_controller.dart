


import 'dart:convert';
import 'package:ah_store/const/consts.dart';
import 'package:ah_store/helper/request_helper.dart';
import 'package:ah_store/models/user_model.dart';
import 'package:ah_store/view/global_view.dart';
import 'package:ah_store/view/welcome.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {

  auth()async{

    var token = await GetStorage().read('token');
    print(token);
    if(token==null){
      Get.offAll(const Welcome());
    } else {
      // var response = await http.get(
      //   Uri.parse('${KConstants.domain}api/me'),
      //   headers: {'Authorization': 'Bearer $token'}
      // );
      var response = await RequestHelper.get(url: '${KConstants.domain}api/me');
      if(response.statusCode==200){
        UserModel userModel = UserModelReq.fromJson(response.body).userModel!;
        print('ioo : ${userModel.token}');
        Get.offAll(const GlobalView(),arguments: userModel);
      }else{
        Get.offAll(const Welcome());
      }

    }
  }
  
}