


import 'package:ah_store/controller/category_content_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../components/category_card.dart';

class CategoryContentView extends StatelessWidget {
  const CategoryContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CategoryContentController());
    return GetBuilder<CategoryContentController>(
        initState: (_){
      Get.find<CategoryContentController>().getCategoryContent();
    },
    builder: (controller) => Scaffold(
    appBar: AppBar(
    centerTitle: true,
    title: const Text('Category Content'),
    backgroundColor: Colors.purple,
    ),
       body: Obx(() => controller.loading.value==true?Center(child: CircularProgressIndicator()):SingleChildScrollView(
    child: Column(
    children: [
    const Text('Categories Content'),
    const SizedBox(height: 50),
    controller.temp.isNotEmpty?GridView.builder(
    shrinkWrap: true,
    itemCount: controller.temp.length,
    itemBuilder: (context , index){
    return CategoryCard(categoryModel: controller.temp[index]);
    }, gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200,
    childAspectRatio: 3 / 2.5,
    crossAxisSpacing: 20,
    mainAxisSpacing: 20),
    ):const SizedBox(),

    ],
    ),
    )),
    )
    );
    }

}
