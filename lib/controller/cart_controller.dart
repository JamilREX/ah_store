
import 'dart:ui';
import 'package:ah_store/const/consts.dart';
import 'package:ah_store/controller/global_controller.dart';
import 'package:ah_store/helper/request_helper.dart';
import 'package:ah_store/models/all_model_req.dart';
import 'package:ah_store/models/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {



  TextEditingController fullNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();




  var cartModel = CartModel(orderItems: []).obs;
  double? finalPrice;
  calcFinalPrice()async {
    double temp = 0;
    for (var item in cartModel.value.orderItems) {
      temp += (item.quantity! * double.parse(item.product!.price.toString()));
    }
    finalPrice = temp;
    update();
}
  setupCart() async {
    var cartModelFromLocal = await GetStorage().read('cartModel');
    print('***********');
    print(cartModelFromLocal);
    print('***********');
    if (cartModelFromLocal != null) {
      cartModel.value = CartModel.fromJson(cartModelFromLocal);
    }
    calcFinalPrice();
    update();
  }

  addProductToCart({required Products product}) {
    bool isExist = false;
    for (var item in cartModel.value.orderItems) {
      if (item.productId == product.id) {
        isExist = true;
      }
    }
    if (isExist == false) {
      OrderItem newOrderItem =
          OrderItem(quantity: 1, productId: product.id, product: product);
      cartModel.value.orderItems.add(newOrderItem);
      Get.snackbar("Success", "Added to the cart",backgroundColor: Color(0xff00ff00),colorText: Color(0xffffffff),);
    } else {
      Get.snackbar('No', 'This product is already in the cart !' ,backgroundColor: Color(0xffff0000),colorText: Color(0xffffffff),
          snackPosition: SnackPosition.TOP);
    }
    GetStorage().write('cartModel', cartModel);

    calcFinalPrice();
  }

  changeQuantity(String type, Products product) {
    // type = inc or dec
    for (var item in cartModel.value.orderItems) {
      if (item.productId == product.id) {
        if (type == 'inc') {
          item.quantity = (item.quantity! + 1);
        } else {
          if (item.quantity != 1) {
            item.quantity = (item.quantity! - 1);
          }
        }
      }
    }
    GetStorage().write('cartModel', cartModel);
    calcFinalPrice();
  }

  deleteProductFromCart(OrderItem orderItem) {
    cartModel.value.orderItems.remove(orderItem);
    GetStorage().write('cartModel', cartModel);
    calcFinalPrice();
    update();
  }

  buy() async {


    if(fullNameController.text=='' || locationController.text == '' || phoneNumberController.text == ''){
      //todo show snackbar : fill all
      print('errrrrrrrrrrrrrrrrror');
    }else{
      for(var item in cartModel.value.orderItems){
        item.dataa = {};
        item.dataa!['Full name'] = fullNameController.text;
        item.dataa!['Location'] = locationController.text;
        item.dataa!['Phone Number'] = phoneNumberController.text;
      }
      var response = await RequestHelper.post( url :KConstants.domain + 'api/order/add',body :cartModel.toJson());

      if(response.statusCode==201){

        if(Get.isDialogOpen==true){
          Get.back();
        }


        //Get.find<GlobalController>().updateUserInformation();
        cartModel.value.orderItems = [];
        calcFinalPrice();
        Get.find<GlobalController>().updateUserInformation();
        update();
      }else{
        //todo edit snackbar color
        print(response.statusCode);
        print(response.body);
        Get.snackbar(response.body['status'], response.body['msg']);
      }
      GetStorage().write('cartModel', cartModel);
      //Get.snackbar("Success", "you purchase has been made ,we will contact you shortly !",backgroundColor: Color(0xff00ff00));
    }







  }

  @override
  void onInit() {
    print('iniiiiiiiiiiiiiiiiiit');
    setupCart();
    super.onInit();
  }

  @override
  void onReady() {
    print('readyyyyyyyyyyyyyyyyyyy');
    super.onReady();
  }
}
