import 'dart:convert';

import 'package:ah_store/const/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var loading = false.obs;

  signUp() async {
    if (fullNameController.text == '' ||
        usernameController.text == '' ||
        emailController.text == '' ||
        passwordController.text == '') {
      Get.snackbar('خطأ', 'الرجاء ملء جميع الحقول الفارغة');
    } else if (passwordController.text.length < 6) {
      Get.snackbar('خطأ', 'ادخل كلمة مرور أطول من 6 أحرف');
    } else {
      loading.value = true;

      var response = await http.post(
        Uri.parse(KConstants.domain + 'api/create'),
        body: {
          'username' : usernameController.text,
          'password' : passwordController.text,
          'email' : emailController.text,
          'full_name' : fullNameController.text,
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