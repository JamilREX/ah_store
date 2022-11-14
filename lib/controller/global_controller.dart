

import 'package:ah_store/view/homeView.dart';
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
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];












}