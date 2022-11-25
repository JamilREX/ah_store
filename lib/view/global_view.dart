

import 'package:ah_store/controller/global_controller.dart';
import 'package:ah_store/models/user_model.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class GlobalView extends StatelessWidget {
  const GlobalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel userModel = UserModel();
    try{
      userModel = Get.arguments;
    }catch(e){
      print(e);
    }
    Get.lazyPut(() => GlobalController());
    return GetBuilder<GlobalController>(
      initState: (_){
        Get.find<GlobalController>().userModel = userModel;
      },
      builder:(controller)=>Scaffold(
        //extendBody: true,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.white,
          buttonBackgroundColor: Colors.purple,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 400),
          onTap: (value){
            controller.changeIndex(value);
           controller.navbarTrigger(value);
          },
         // buttonBackgroundColor: Colors.purple,
          items: [
            Icon(Icons.home , color: controller.index==0?Colors.white:Colors.black),
            Icon(Icons.production_quantity_limits, color: controller.index==1?Colors.white:Colors.black),
            Icon(Icons.ac_unit, color: controller.index==2?Colors.white:Colors.black),
            Icon(Icons.person_pin, color: controller.index==3?Colors.white:Colors.black),
          ],
        ),
        body: controller.screens[controller.index],
      )
    );
  }
}
