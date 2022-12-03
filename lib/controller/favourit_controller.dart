


import 'package:ah_store/models/all_model_req.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';

class FavouritController extends GetxController{

  var modelProduct=FullCategory(products: []).obs;

  addToFavourites({required Products product}){
    for (var item in modelProduct.value.products!) {
      if (item.favoriteCount ==1) {
          modelProduct.value.products!.add(item);
      }
    }
  }
}