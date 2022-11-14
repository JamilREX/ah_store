import 'dart:convert';
import 'package:ah_store/const/consts.dart';
import 'package:ah_store/view/auth_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;


class LoginController extends GetxController {
  TextEditingController usernameControllerLogin = TextEditingController();
  TextEditingController passwordControllerLogin = TextEditingController();

  var loading = false.obs;

  login() async{
    if( usernameControllerLogin.text == '' || passwordControllerLogin.text == ''){
      Get.snackbar('خطأ', 'الرجاء ملء جميع الحقول الفارغة');
    } else if (passwordControllerLogin.text.length < 6) {
      Get.snackbar('خطأ', 'ادخل كلمة مرور أطول من 6 أحرف');
    }
    else{
      loading.value = true;
      var response = await http.post(
          Uri.parse(KConstants.domain + 'api/login'),
          body: {
            'username' : usernameControllerLogin.text,
            'password' : passwordControllerLogin.text,
          }
      );
      if(response.statusCode==201 || response.statusCode==200){
        Get.snackbar('done', 'done');
        String token = jsonDecode(response.body)['data']['token'];
        await GetStorage().write('token', token);


        print(token);
        Get.offAll(const AuthView());
      } else {
        Get.snackbar('خطأ', jsonDecode(response.body)['msg']);
        print('body = ${response.body}');
      }
      loading.value = false;
    }
  }
  }