import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../controller/login_controller.dart';
import '../widget/textField.dart';
import 'homeView.dart';

class Login extends StatelessWidget {
  Login();
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GetBuilder<LoginController>(
      builder: (controller) =>Scaffold(
      body: Container(
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
                    SizedBox(
                      height: 350,
                    ),
                    // MyTextField(
                    //     labelText: 'UserName',textHint: 'Enter UserName' , icon: Icon(Icons.account_circle_sharp)),
                    SizedBox(
                      height: 22,
                    ),
                    MyTextField(
                      onChanged: (value) {
                        controller.usernameControllerlogin.text = value;
                        controller.update();
                        print(value);
                      },
                      textEditingController: controller.usernameControllerlogin,
                      labelText: 'username',
                      textHint: 'Enter username',
                      icon: Icon(Icons.person),
                    ),
                    SizedBox(
                      height: 22,),
                      MyTextField(
                        onChanged: (value) {
                          controller.passwordControllerlogin.text = value;

                        },
                        textEditingController: controller.passwordControllerlogin,
                        labelText: 'password',
                        textHint: 'Enter password',
                        keyboardType: TextInputType.visiblePassword,
                      ),

                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Text("forget password ? ")
                      ],
                    ),
                    SizedBox(
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
                              print(controller.usernameControllerlogin);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.purple),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      horizontal: 79, vertical: 10)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(27))),
                            ),
                            child:  Obx(() => controller.loading.value==true?CircularProgressIndicator(color: Colors.white,):Text(
                              "LOGIN",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ),
                        ),
                        Expanded(child: Container()),
                        SizedBox(height: 45,),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      width: 175,
                      height: 200,
                      child: Image.asset('assets/images/main_top.png'))),
              Positioned(
                  left: 200,
                  top: 100,
                  child: Container(
                      width: 200,
                      height: 200,
                      child: SvgPicture.asset('assets/images/login.svg'))),
              Positioned(
                left: 35,
                top: 260,
                child: Container(
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
