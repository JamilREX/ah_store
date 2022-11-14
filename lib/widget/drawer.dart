

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/home_controller.dart';
import '../models/user_model.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel userModel = Get.arguments;
    Get.lazyPut(() => HomeController());
    return GetBuilder<HomeController>(
      initState: (_){
        Get.find<HomeController>().userModel = userModel;
      },
      builder: (controller) =>
      Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
    children: [
    Container(
      color: Colors.purple,
      child: UserAccountsDrawerHeader(
      accountName: Text(controller.userModel.username!),
      accountEmail: Text(controller.userModel.fullName!),
      currentAccountPicture: CircleAvatar(
      backgroundImage: NetworkImage(
      "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
      ),
      decoration: BoxDecoration(
      image: DecorationImage(
      image: NetworkImage(
      "https://appmaking.co/wp-content/uploads/2021/08/android-drawer-bg.jpeg",
      ),
      fit: BoxFit.fill,
      ),
      ),
      otherAccountsPictures: [

      ],
      ),
    ),
    ListTile(
    leading: Icon(Icons.home),
    title: Text("Home"),
    onTap: () {},
    ),
    ListTile(
    leading: Icon(Icons.account_box),
    title: Text("About"),
    onTap: () {},
    ),
    ListTile(
    leading: Icon(Icons.grid_3x3_outlined),
    title: Text("Products"),
    onTap: () {},
    ),
    ListTile(
    leading: Icon(Icons.contact_mail),
    title: Text("log Out"),
    onTap: () {},
    )
    ],
    ),
    )
    );
  }
}
