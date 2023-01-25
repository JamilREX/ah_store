import 'package:ah_store/controller/add_transfer_controller.dart';
import 'package:ah_store/models/all_model_req.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../widget/textField.dart';

class AddTransferView extends StatelessWidget {
  const AddTransferView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddTransferController());
    return GetBuilder<AddTransferController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Add transfer'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  //color: Colors.grey.shade200,
                  width: Get.width*0.5,
                  child: Neumorphic(
                    margin: const EdgeInsets.only(bottom: 8, top: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    style: NeumorphicStyle(
                        depth: -4,
                        intensity: 0.8,
                        color: Colors.white,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20
                              // topRight: Radius.circular(20),
                              // bottomRight: Radius.circular(20)
                            ))),
                    child: const Text(
                      textAlign: TextAlign.center,
                      'info',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.black87),
                    ),
                  ),
                ),
                Container(
                  //color: Colors.grey.shade200,
                  height: Get.height * 0.07,
                  child: ListView.builder(
                    itemCount: controller.transfersList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [

                          Container(
                            child: Text(
                                '${controller.transfersList[index].name.toString()}  :  ${controller.transfersList[index].info.toString()}'),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Text("choose the payment method and then fill in the feild with the required data",textAlign: TextAlign.center,style: TextStyle(color: Colors.black),),
                SizedBox(height: 36),
                DropdownButtonFormField<TransferWay>(
                    decoration: InputDecoration(
                   //   hintText: widget.textHint,
                      labelStyle: const TextStyle(color: Colors.black26),
                      hintStyle: const TextStyle(color: Colors.black26),
                    //  labelText: widget.labelText,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(27),
                        borderSide: const BorderSide(
                          style: BorderStyle.solid,
                        ),
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.all(16),
                      fillColor: Colors.white24,
                    ),
                    items: controller.transfersList
                        .map((e) => DropdownMenuItem(
                            value: e, child: Text(e.name.toString())))
                        .toList(),
                    onChanged: (value) {
                      controller.selectedTransferWay = value!;
                    }),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  textEditingController: controller.amountController,
                  onChanged: (value) {
                    controller.amountController.text = value;
                  },
                  labelText: 'amount',
                  textHint: '8000',
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  textEditingController: controller.fullNameController,
                  onChanged: (value) {
                    controller.fullNameController.text = value;
                  },
                  labelText: 'Full name',
                  textHint: 'Ahmad Tarek Bakkar',
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  textEditingController: controller.locationController,
                  onChanged: (value) {
                    controller.locationController.text = value;
                  },
                  labelText: 'Location',
                  textHint: 'Aleppo',
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  textEditingController: controller.phoneNumberController,
                  onChanged: (value) {
                    controller.phoneNumberController.text = value;
                  },
                  labelText: 'phone',
                  textHint: '+963 xxx-xxxx-xxx',
                ),

                SizedBox(
                  height: 30,
                ),

                ElevatedButton(onPressed: (){controller.addTransfer();}, child: Text('add transfer'), style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 78, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27))),
                ),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
