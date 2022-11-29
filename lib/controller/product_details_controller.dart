

import 'package:ah_store/controller/cart_controller.dart';
import 'package:ah_store/models/all_model_req.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{


  addProductToCartView(Products product){
     Get.find<CartController>().addProductToCart(product: product);
  }





}