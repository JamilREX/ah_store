
import 'dart:convert';

import 'package:ah_store/const/consts.dart';
import 'package:ah_store/helper/request_helper.dart';
import 'package:ah_store/models/category_model.dart';
import 'package:ah_store/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {

  UserModel userModel = UserModel();

  var loading = false.obs;


  List<CategoryModel> categoryModelList = [];
  List<CategoryModel> homeCategoryModelList = [];


  getCategories() async {
    homeCategoryModelList = [];
    loading.value = true;
    http.Response response = await RequestHelper.get(
        url: KConstants.domain + 'api/category/all');
    if (response.statusCode == 200) {
      categoryModelList = CategoryModelReq
          .fromJson(jsonDecode(response.body))
          .categoryModel!;
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