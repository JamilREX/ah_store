

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../const/consts.dart';
import '../helper/request_helper.dart';
import '../models/category_model.dart';

class CategoryContentController extends GetxController{
  var loading = false.obs;
 // List<CategoryModel> categoryModelList = [];
  List<CategoryModel> categoryContentList = [];
  List<CategoryModel> temp=[];

  getCategoryContent() async {
   temp=[];
    loading.value = true;
    http.Response response = await RequestHelper.get(
        url: KConstants.domain + 'api/category/all');
    if (response.statusCode == 200) {
      categoryContentList = CategoryModelReq
          .fromJson(jsonDecode(response.body))
          .categoryModel!;
      for (var item in categoryContentList) {
        if (item.parentId ==item.categoryId) {
          temp.add(item);
        }
      }
    }
    loading.value = false;
    update();

  }
}