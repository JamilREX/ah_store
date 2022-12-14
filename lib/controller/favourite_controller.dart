

import 'package:ah_store/controller/home_controller.dart';
import 'package:ah_store/models/all_model_req.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {


  RxList<Products> favProducts = <Products>[].obs ;

  getFavProductsLocally(){



    // hi
    favProducts.value = [];
    for(FullCategory fullCategory in Get.find<HomeController>().allModel.fullCategoryList!){
      for(Products product in fullCategory.products!){
        if(product.favoriteCount==1){
          favProducts.value.add(product);
          update();
        }
      }
    }

  }









}