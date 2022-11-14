

import 'package:ah_store/controller/global_controller.dart';
import 'package:ah_store/models/user_model.dart';
import 'package:ah_store/view/homeView.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class GlobalView extends StatelessWidget {
  const GlobalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    UserModel userModel = Get.arguments;
    Get.lazyPut(() => GlobalController());
    return GetBuilder<GlobalController>(
      initState: (_){
        Get.find<GlobalController>().userModel = userModel;
      },
      builder:(controller)=>Scaffold(
        //extendBody: true,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,

          animationDuration: Duration(milliseconds: 300),
          onTap: (value){
            controller.changeIndex(value);
            controller.navbarTrigger(value);
          },
          buttonBackgroundColor: Colors.purple,
          items: [
            Icon(Icons.access_time , color: controller.index==0?Colors.white:Colors.black),
            Icon(Icons.access_time, color: controller.index==1?Colors.white:Colors.black),
            Icon(Icons.access_time, color: controller.index==2?Colors.white:Colors.black),
            Icon(Icons.access_time, color: controller.index==3?Colors.white:Colors.black),
          ],
        ),
        body: controller.screens[controller.index],
      )
    );
  }
}
