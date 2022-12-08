import 'dart:io';

import 'package:ah_store/const/consts.dart';
import 'package:ah_store/helper/image_uploader.dart';
import 'package:ah_store/helper/request_helper.dart';
import 'package:ah_store/models/all_model_req.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {





 // UserModel userModel = UserModel();

  var loading = false.obs;
  var favLoading = false.obs;
  AllModel allModel = AllModel();
  var categoryModelList = [].obs;
  var homeCategoryModelList = [].obs ;
  var productChanging = '0'.obs;


  // post /api/favourite/add
  // requires fields in body : product_id:44
   changeFavourite(String productId)async{
     productChanging.value = productId;
     favLoading.value = true;
     var response =await RequestHelper.post(url: '${KConstants.domain}api/favorite/add' , body: {
       'product_id' : productId,
     });
     print(response.statusCode);
     print(response.body);
     if(response.statusCode==201){
       await getCategories();
     }
     favLoading.value = false;
     productChanging.value = '0';
   }




  getCategories() async {
    homeCategoryModelList.value = [];
    loading.value = true;
    var response = await RequestHelper.get(
        url: '${KConstants.domain}api/product/all');
    if (response.statusCode == 200) {
      print(response.body);
      allModel = AllModelReq.fromJson(response.body).allModel!;
      categoryModelList.value = allModel.fullCategoryList!;
      for (var item in categoryModelList) {
        if (item.parentId == 0) {
          homeCategoryModelList.add(item);
        }
      }
    }
    loading.value = false;
    update();
  }


}