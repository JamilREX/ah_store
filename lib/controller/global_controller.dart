

import 'dart:convert';

import 'package:ah_store/view/cart_view.dart';
import 'package:ah_store/view/home_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../const/consts.dart';
import '../models/user_model.dart';

class GlobalController extends GetxController {


  UserModel userModel = UserModel();
  int index = 0;


  updateUserInformation()async{
    print(userModel.username);
    String? token = userModel.token;
    print('ttttttt : $token');
    var response = await GetConnect().get(
        '${KConstants.domain}api/me',
        headers: {'Authorization': 'Bearer $token'}
    );
    print('hhh : ${response.statusCode}');
    if(response.statusCode==200){
      userModel = UserModel.fromJson(response.body);
    }
    update();
  }


  changeIndex(int value){
    index = value;
    update();
  }

  navbarTrigger(int value){
    if(value==0){

    }
  }

  List<Widget> screens = [
    const HomeView(),
    const CartView(),
    Scaffold(appBar: AppBar(
      backgroundColor: Colors.purple,
    ),
    body: Container(child: const Text("screen 3 ",style: TextStyle(fontSize: 25),),),),
    Scaffold(appBar: AppBar(
      backgroundColor: Colors.purple,
    ),
    body: Container(child: const Text("screen 4 ",style: TextStyle(fontSize: 25),),),),
  ];












}