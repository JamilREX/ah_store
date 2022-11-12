

import 'dart:convert';

import 'package:ah_store/const/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class LoginController extends GetxController {
  TextEditingController usernameControllerlogin = TextEditingController();
  TextEditingController passwordControllerlogin = TextEditingController();

  var loading = false.obs;

  login() async{
    if( usernameControllerlogin.text == '' || passwordControllerlogin.text == ''){
      Get.snackbar('خطأ', 'الرجاء ملء جميع الحقول الفارغة');
    } else if (passwordControllerlogin.text.length < 6) {
      Get.snackbar('خطأ', 'ادخل كلمة مرور أطول من 6 أحرف');
    }
    else{
      loading.value = true;

      var response = await http.post(
          Uri.parse(KConstants.domain + 'api/'),
          body: {
            'username' : usernameControllerlogin.text,
            'password' : passwordControllerlogin.text,
          }
      );

      if(response.statusCode==201 || response.statusCode==200){
        Get.snackbar('done', 'done');
      } else {
        Get.snackbar('خطأ', jsonDecode(response.body)['message']);
      }
    }
  }
  }