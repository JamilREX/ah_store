import 'dart:convert';
import 'package:ah_store/const/consts.dart';
import 'package:ah_store/controller/global_controller.dart';
import 'package:ah_store/helper/request_helper.dart';
import 'package:ah_store/models/all_model_req.dart';
import 'package:ah_store/models/cart_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  var cartModel = CartModel(orderItems: []).obs;
  double? finalPrice;

  calcFinalPrice() {
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
    } else {
      Get.snackbar('No', 'This product is already in the cart !',
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
    var response = await RequestHelper.post( url :KConstants.domain + 'api/order/add',body :cartModel.toJson());
    if(response.statusCode==201){
      Get.find<GlobalController>().updateUserInformation();
      cartModel.value.orderItems = [];
      calcFinalPrice();
      update();
    }
    GetStorage().write('cartModel', cartModel);
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
