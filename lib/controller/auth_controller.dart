


import 'dart:convert';
import 'package:ah_store/const/consts.dart';
import 'package:ah_store/models/user_model.dart';
import 'package:ah_store/view/homeView.dart';
import 'package:ah_store/view/welcome.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
class AuthController extends GetxController {

  auth()async{
    var token = await GetStorage().read('token');
    if(token==null){
      Get.offAll(const Welcome());
    } else {
      var response = await http.get(
        Uri.parse(KConstants.domain + 'api/me'),
        headers: {'Authorization': 'Bearer $token'}
      );
      if(response.statusCode==200){
        UserModel userModel = UserModelReq.fromJson(jsonDecode(response.body)).userModel!;
        Get.offAll(const HomeView(),arguments: userModel);
      }else{
        Get.offAll(const Welcome());
      }

    }
  }
  
}