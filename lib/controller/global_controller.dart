

import 'package:ah_store/view/home_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class GlobalController extends GetxController {


  UserModel userModel = UserModel();

  int index = 0;

  changeIndex(int value){
    index = value;
    update();
  }

  navbarTrigger(int value){
    if(value==0){
      //todo update home screen
    }
  }

  List<Widget> screens = [
    HomeView(),
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: Container(child: Text("screen 2 ",style: TextStyle(fontSize: 25),),),
    ),
    Scaffold(appBar: AppBar(
      backgroundColor: Colors.purple,
    ),
    body: Container(child: Text("screen 3 ",style: TextStyle(fontSize: 25),),),),
    Scaffold(appBar: AppBar(
      backgroundColor: Colors.purple,
    ),
    body: Container(child: Text("screen 4 ",style: TextStyle(fontSize: 25),),),),
  ];












}