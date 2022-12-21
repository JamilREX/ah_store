import 'package:ah_store/const/consts.dart';
import 'package:ah_store/controller/global_controller.dart';
import 'package:ah_store/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controller/home_controller.dart';


class ProfileView extends StatelessWidget {



  // hello
  /////////////////////////////////////////////////
  //..
  // jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj
  // hh
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
                 // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 75),
                    Container(
                      width: Get.width*0.5/2,
                      child: MyTextField(textEditingController: controller.fullNameController,
                        onChanged: (value){
                        controller.fullNameController.text = value;
                        controller.update();
                        }, labelText: 'full name',
                        textHint: '',


                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Email : ",style: TextStyle(fontSize: 25),),
                        Text(Get.find<GlobalController>().userModel.value.username.toString(),style: TextStyle(fontSize: 25),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("TypeUser : ",style: TextStyle(fontSize: 25),),
                        Text(Get.find<GlobalController>().userModel.value.userType.toString(),style: TextStyle(fontSize: 25),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Your balance : ",style: TextStyle(fontSize: 25),),
                        Container(child: Text("\$"+Get.find<GlobalController>().userModel.value.balance.toString(),style: TextStyle(fontSize: 25),)),
                      ],
                    ),
                    ElevatedButton(onPressed: (){
                      controller.editUserInfo();
                    }, child: Text('Save')),
                    Text("to charge your balance ,conact us "),
                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      InkWell(child: Icon(Icons.whatsapp,size: 30,color: Colors.green,) , onTap: ()async{

                        await launchUrl(Uri.parse(KConstants.whatsAppUrl) , mode: LaunchMode.externalNonBrowserApplication);



                      },),

                      SizedBox(width: 20,),
                      InkWell(child: Icon(Icons.telegram,size: 30,color: Colors.blue,),onTap: ()async{
                        await launchUrl(Uri.parse(KConstants.telegramUrl) , mode: LaunchMode.externalNonBrowserApplication);
                      }),
                    ],)
                  ],
                ),
          )
          ),
          Positioned(
            top:Get.height*0.1/2,
              left: Get.width*0.38,
            child:  InkWell(
            onTap: (){

              //
              print('');
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
          ),)
        ],
      ),
     )
    );
  }
}
