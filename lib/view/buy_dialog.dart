import 'package:ah_store/controller/cart_controller.dart';
import 'package:ah_store/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyDialog extends StatelessWidget {
  const BuyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: Get.width * 0.1, vertical: Get.height * 0.25),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade50,
        ),
        child: GetBuilder<CartController>(
          builder: (controller) => Material(
            color: Colors.transparent,
            child: Column(
              children: [
                //fullname
                MyTextField(
                  textEditingController: controller.fullNameController,
                  onChanged: (value) {
                    controller.fullNameController.text = value;
                  },
                  labelText: 'Full Name',
                  textHint: 'Ahmad kamel Albakar',
                ),
                SizedBox(height: 20),
                // location
                MyTextField(
                  textEditingController: controller.locationController,
                  onChanged: (value) {
                    controller.locationController.text = value;
                  },
                  labelText: 'your Location',
                  textHint: 'Syria - Aleppo',
                ),
                SizedBox(height: 20),
                MyTextField(
                  keyboardType: TextInputType.number,
                  textEditingController: controller.phoneNumberController,
                  onChanged: (value) {
                    controller.phoneNumberController.text = value;
                  },
                  labelText: 'Phone number',
                  textHint: '+963 xxx-xxx-xxx',
                ),
                Row(
                  children: [
                    ElevatedButton(onPressed: (){
                      controller.buy();
                    }, child: Text('buy')),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
