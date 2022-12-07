import 'dart:convert';

import 'package:ah_store/const/consts.dart';
import 'package:ah_store/helper/request_helper.dart';
import 'package:ah_store/view/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
      var response =
          await RequestHelper.post( body: {
        'username': usernameController.text,
        'password': passwordController.text,
        'email': emailController.text,
        'full_name': fullNameController.text,
      }, url: '${KConstants.domain}api/create');

      if (response.statusCode == 201 || response.statusCode == 200) {
        String token = response.body['data']['token'];
        await GetStorage().write('token', token);
        Get.offAll(const AuthView());
      } else {
        print(response.body);
        Get.snackbar(
          '',
         '',
          backgroundColor: Colors.purple,
          titleText: const Text(
            'خطأ',
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            response.body.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        );
      }

      loading.value = false;
    }
  }
}
