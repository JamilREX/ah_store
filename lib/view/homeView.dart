import 'package:ah_store/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../widget/drawer.dart';
import '../widget/myList.dart';


class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

     UserModel userModel = Get.arguments;
    Get.lazyPut(() => HomeController());

    return GetBuilder<HomeController>(
      initState: (_){
       Get.find<HomeController>().userModel = userModel;
      },
      builder: (controller) => Scaffold(
       //backgroundColor: Colors.grey,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home'),
          backgroundColor: Colors.purple,
        ),
      //  drawer: MyDrawer(),
        body:

                ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context,i){
                      return Stack(
                          children: [InkWell(
                            onTap: (){
                              Get.to(const Lab());
                            },
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              margin: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurStyle: BlurStyle.solid,
                                      blurRadius: 10.0,
                                      color: Colors.black12.withAlpha(30)
                                  ),
                                ],
                              ),
                              child: Text(controller.userModel.fullName.toString()),
                            ),
                          ),
                            Positioned(
                              child: Container(
                                child: Image.network('https://freesvg.org/img/metalmarious_Laptop.png'),
                                width: 175,
                                height: 150,
                                // color: Colors.green,
                              ),
                              top: 39,
                              left: 25,),
                            Positioned(
                                top: 50,
                                right: 35,
                                child: Column(
                                  children: [
                                    const Text("Labtop hp"),
                                    const Text("*******"),

                                  ],
                                ))
                          ]
                      );
                    }),
        ),
      );

  }
}
class Lab extends StatelessWidget {
  const Lab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
