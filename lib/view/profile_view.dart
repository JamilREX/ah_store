import 'package:ah_store/const/consts.dart';
import 'package:ah_store/controller/global_controller.dart';
import 'package:ah_store/controller/profile_controller.dart';
import 'package:ah_store/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/home_controller.dart';
import '../models/user_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.lazyPut(() => HomeController());
    return GetBuilder<GlobalController>(

      builder: (controller) =>
     Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
        backgroundColor: Colors.purple,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
              child: Container(
            width: Get.width,
            height: Get.height*0.2,
            color: Colors.purple,
          )),
          Positioned(
            top: Get.height*0.1,
              left: Get.width*0.1,
              child: Container(
            width: Get.width*0.8,
            height: Get.height*0.5,

                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    InkWell(
                      onTap: (){
                        controller.getImage();
                      },
                      child:  controller.file==null?controller.userModel.value.avatar!=null? CircleAvatar(
                        radius: 50,
                        foregroundImage: NetworkImage(KConstants.domain + controller.userModel.value.avatar.toString()),
                      ):CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.purple,
                        child: Text(controller.userModel.value.fullName![0] ,style: TextStyle(fontSize: 36), ),
                        // todo replace sizebox to image from gallery
                      ):CircleAvatar(
                        radius: 50,
                        foregroundImage: FileImage(controller.file!),
                      ),
                    ),
                    SizedBox(height: 50),
                    MyTextField(textEditingController: controller.fullNameController, onChanged: (value){
                      controller.fullNameController.text = value;
                    }, labelText: 'labelText', textHint: 'textHint'),
                    
                    
                    ElevatedButton(onPressed: (){
                      controller.editUserInfo();
                    }, child: Text('Save'))


                  ],
                ),
          )
          )
        ],
      ),
     )
    );
  }
}
