import 'package:ah_store/controller/add_transfer_controller.dart';
import 'package:ah_store/models/all_model_req.dart';
import 'package:flutter/material.dart';
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
                  color: Colors.grey.shade200,
                  height: Get.height * 0.24,
                  child: ListView.builder(
                    itemCount: controller.transfersList.length,
                    itemBuilder: (context, index) {
                      return Text(
                          '${controller.transfersList[index].name.toString()}  :  ${controller.transfersList[index].info.toString()}');
                    },
                  ),
                ),
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
                  height: 10,
                ),

                ElevatedButton(onPressed: (){controller.addTransfer();}, child: Text('add transfer'))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
