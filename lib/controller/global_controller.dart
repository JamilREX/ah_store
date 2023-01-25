import 'dart:io';
import 'package:ah_store/controller/order_log_controller.dart';
import 'package:ah_store/helper/request_helper.dart';
import 'package:ah_store/view/auth_view.dart';
import 'package:ah_store/view/cart_view.dart';
import 'package:ah_store/view/home_view.dart';
import 'package:ah_store/view/order_log_view.dart';
import 'package:ah_store/view/profile_view.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../const/consts.dart';
import '../helper/image_uploader.dart';
import '../models/user_model.dart';
import 'package:ah_store/view/favourite_view.dart';

class GlobalController extends GetxController {


  var userModel = UserModel().obs;


  signout(){
    Get.dialog(
      Neumorphic(
        style: NeumorphicStyle(
          intensity: 0.4,
        ),
        margin: EdgeInsets.symmetric(horizontal: Get.width*0.08,vertical: Get.height*0.38),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Are you sure to Sign out ?' , style: TextStyle(fontWeight: FontWeight.w700 , fontSize: 18),),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeumorphicButton(
                  padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
                  onPressed: ()async{
                    await GetStorage().erase();
                    Get.offAll(AuthView());
                  },
                  style: NeumorphicStyle(
                    color: Colors.purple,
                  ),
                  child: Text('Yes' , style: TextStyle(color: Colors.white),),
                ),
                SizedBox(width: 30),
                NeumorphicButton(
                  padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
                  onPressed: (){
                    Get.back();
                  },
                  style: NeumorphicStyle(
                    color: Colors.white,
                  ),
                  child: Text('No'),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
 



  int index = 0;


  TextEditingController fullNameController = TextEditingController();



  File? file;
  String? finalImageUrl;


  Future<String>getImage()async{
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    // CroppedFile? croppedFile = await ImageCropper().cropImage(
    //   sourcePath: image!.path,
    //   aspectRatioPresets: [
    //     CropAspectRatioPreset.square,
    //   ],
    // );
    file = File(image!.path);
    var imageUrl = await ImageUploader.uploadAndGetUrl(xFile: XFile(file!.path));
    print(imageUrl);
    finalImageUrl = imageUrl;
    update();
    return imageUrl;
  }



  editUserInfo()async{


    if(fullNameController.text==''){
      //todo snackabr to enter fullname
    }
    else if(file==null){
      var response = await RequestHelper.post(url: KConstants.domain + 'api/profile/update', body: {
        'avatar' : userModel.value.avatar,
        'full_name' : fullNameController.text,
      });
      print(response.body);
      if(response.statusCode==200){
        Get.snackbar('done', 'User information is updated' );
      }
      print('888888888888888888888888');
      print(response.statusCode);
    }else{
      var response = await RequestHelper.post(url: KConstants.domain + 'api/profile/update', body: {
        'avatar' :  finalImageUrl,
        'full_name' : fullNameController.text,
      });
      if(response.statusCode==200){
        file=null;
        Get.snackbar('done', 'User information is updated');
      }
      print('888888888888888888888888');
      print(response.statusCode);
    }


    await updateUserInformation();
    update();


  }



  updateUserInformation()async{
    var response = await RequestHelper.get(
        url :'${KConstants.domain}api/me',
    );
    print('hhh : ${response.statusCode}');
    if(response.statusCode==200){
      print(response.body);
      print('before : ${userModel.value.username}');
      userModel.value = UserModelReq.fromJson(response.body).userModel!;
      print('after : ${userModel.value.username}');
    }
    fullNameController.text = userModel.value.fullName!;
    update();
  }


  changeIndex(int value){
    index = value;
    update();
  }

  navbarTrigger(int value){
    if(value==0 || value==3){
      print('kkkkkkkkkkkkkkkkkkkkkkkkkk');
      updateUserInformation();
    }
    if(value==2){
      Get.find<OrderLogController>().getOrdersList();
    }
  }

  List<Widget> screens = [
    const HomeView(),
    const CartView(),
    const OrderLogView(),
    const FavouriteView(),
    const ProfileView(),
  ];












}