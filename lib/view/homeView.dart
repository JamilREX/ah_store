import 'package:ah_store/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../widget/drawer.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    UserModel userModel = Get.arguments;
    Get.lazyPut(() => HomeController());

    return GetBuilder<HomeController>(
      initState: (_){
        Get.find<HomeController>().userModel = userModel;
      },
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
        ),
        drawer: MyDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Home view'),
              //Text(controller.userModel.username!),
            ],
          ),
        ),
        // (
        //     ListView.builder(
        //         physics: BouncingScrollPhysics(),
        //         itemCount: 5,
        //         itemBuilder: (context,i){
        //           return Container(
        //             height: 200,
        //             width: double.infinity,
        //             margin: EdgeInsets.all(15),
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(15),
        //               color: Colors.white,
        //               boxShadow: [
        //                 BoxShadow(
        //                     blurStyle: BlurStyle.normal,
        //                     blurRadius: 5.0,
        //                     color: Colors.purple
        //                 ),
        //               ],
        //             ),
        //           );
        //         })
        // ),
      ),
    );
  }
}
