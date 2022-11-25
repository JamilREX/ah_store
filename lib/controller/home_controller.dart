import 'dart:convert';
import 'package:ah_store/const/consts.dart';
import 'package:ah_store/helper/request_helper.dart';
import 'package:ah_store/models/all_model_req.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {

 // UserModel userModel = UserModel();

  var loading = false.obs;
  AllModel allModel = AllModel();
   List<FullCategory> categoryModelList = [];
   List<FullCategory> homeCategoryModelList = [];

  getCategories() async {
    homeCategoryModelList = [];
    loading.value = true;
    http.Response response = await RequestHelper.get(
        url: '${KConstants.domain}api/product/all');
    if (response.statusCode == 200) {
      allModel = AllModelReq.fromJson(jsonDecode(response.body)).allModel!;
      categoryModelList = allModel.fullCategoryList!;
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