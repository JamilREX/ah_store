
import 'package:ah_store/controller/cart_controller.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(CartController() , permanent: true);
  }

}