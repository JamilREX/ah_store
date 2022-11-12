
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/textField.dart';

class Signup extends StatelessWidget {
  Signup();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 350,),
                    MyTextField("Name","Enter Name",Icon(Icons.accessibility_new)),
                    SizedBox(height: 22,),
                    MyTextField("Email", "Enter Email", Icon(Icons.email)),
                    SizedBox(height: 22,),
                    MyTextField("UserName", "Enter UserName", Icon(Icons.account_circle_sharp)),
                    SizedBox(height: 22,),
                    MyTextField("password", "Enter password", Icon(Icons.remove_red_eye)),
                    SizedBox(height: 5,),
                    SizedBox(height: 35,),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Expanded(
                          flex: 4,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => Login()),
                              // );
                            },

                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.purple),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(horizontal: 79, vertical: 10)),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27))),
                            ),
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(fontSize: 22),
                            ),
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
                  child: Container(
                    width: 175,
                    height: 200,
                    child:Image.asset('assets/images/main_top.png'),)),
              Positioned(
                  left: 200,
                  top: 100,
                  child: Container(
                      width: 200,
                      height: 200,
                      child: SvgPicture.asset('assets/images/signup.svg'))),
              Positioned(
                left: 35,
                top: 260,
                child: Container(
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
    )
    );
  }
}
