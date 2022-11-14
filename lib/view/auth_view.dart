import 'package:ah_store/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return GetBuilder<AuthController>(
      initState: (_){
        Get.find<AuthController>().auth();
      },
      builder: (controller) => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
