import 'package:ah_store/controller/signup_controller.dart';
import 'package:ah_store/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widget/textField.dart';

class Signup extends StatelessWidget {






  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return GetBuilder<SignupController>(
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 350,
                    ),
                    //MyTextField("Name","Enter Name",Icon(Icons.accessibility_new)),


                    MyTextField(
                      onChanged: (value) {
                        print(value);
                        controller.fullNameController.text = value;
                        controller.update();
                        print(value);
                      },
                      textEditingController: controller.fullNameController,
                      labelText: 'Full name',
                      textHint: 'Enter full name',
                      icon: const Icon(Icons.accessibility_new),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    // MyTextField("Email", "Enter Email", Icon(Icons.email)),
                    MyTextField(
                      onChanged: (value) {
                        controller.usernameController.text = value;
                      },
                      textEditingController: controller.usernameController,
                      labelText: 'username',
                      textHint: 'Enter username',
                      icon: const Icon(Icons.person),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    // MyTextField("UserName", "Enter UserName", Icon(Icons.account_circle_sharp)),
                    MyTextField(
                        onChanged: (value) {
                          controller.emailController.text = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        textEditingController: controller.emailController,
                        labelText: 'email',
                        textHint: 'Enter email',
                        icon: const Icon(Icons.email)),
                    const SizedBox(
                      height: 22,
                    ),
                    // MyTextField("password", "Enter password", Icon(Icons.remove_red_eye)),
                    MyTextField(
                      onChanged: (value) {
                        controller.passwordController.text = value;
                      },
                      textEditingController: controller.passwordController,
                      labelText: 'password',
                      textHint: 'Enter password',
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Expanded(
                          flex: 4,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.signUp();
                              Get.offAll(const HomeView());
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.purple),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(vertical: 10)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(27))),
                            ),
                            child: Obx(() => controller.loading.value==true?const CircularProgressIndicator(color: Colors.white,):const Text(
                              "SIGN UP",
                              style: TextStyle(fontSize: 22),
                            ),)
                          ),
                        ),
                        Expanded(child: Container())
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  left: 0,
                  top: 0,
                  child: SizedBox(
                    width: 175,
                    height: 200,
                    child: Image.asset('assets/images/main_top.png'),
                  )),
              Positioned(
                  left: 200,
                  top: 100,
                  child: SizedBox(
                      width: 200,
                      height: 200,
                      child: SvgPicture.asset('assets/images/signup.svg'))),
              const Positioned(
                left: 35,
                top: 260,
                child: SizedBox(
                  width: 120,
                  height: 100,
                  child: Text(
                    "SIGNUP",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
