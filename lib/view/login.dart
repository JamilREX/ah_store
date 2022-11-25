import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


import '../controller/login_controller.dart';
import '../widget/textField.dart';


class Login extends StatelessWidget {
  Login();
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GetBuilder<LoginController>(
      builder: (controller) =>Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
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
                    // MyTextField(
                    //     labelText: 'UserName',textHint: 'Enter UserName' , icon: Icon(Icons.account_circle_sharp)),
                    const SizedBox(
                      height: 22,
                    ),
                    MyTextField(
                      onChanged: (value) {
                        controller.usernameControllerLogin.text = value;
                        controller.update();
                        print(value);
                      },
                      textEditingController: controller.usernameControllerLogin,
                      labelText: 'username',
                      textHint: 'Enter username',
                      icon: const Icon(Icons.person),
                    ),
                    const SizedBox(
                      height: 22,),
                      MyTextField(
                        onChanged: (value) {
                          controller.passwordControllerLogin.text = value;

                        },
                        textEditingController: controller.passwordControllerLogin,
                        labelText: 'password',
                        textHint: 'Enter password',
                        keyboardType: TextInputType.visiblePassword,
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
                              controller.login();
                              print(controller.usernameControllerLogin);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.purple),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      horizontal: 79, vertical: 10)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(27))),
                            ),
                            child:  Obx(() => controller.loading.value==true?const CircularProgressIndicator(color: Colors.white,):const Text(
                              "LOGIN",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ),
                        ),
                        Expanded(child: Container()),
                        const SizedBox(height: 45,),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: SizedBox(
                      width: 175,
                      height: 200,
                      child: Image.asset('assets/images/main_top.png'))),
              Positioned(
                  left: 200,
                  top: 100,
                  child: SizedBox(
                      width: 200,
                      height: 200,
                      child: SvgPicture.asset('assets/images/login.svg'))),
              const Positioned(
                left: 35,
                top: 260,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      )
    );
  }
}
