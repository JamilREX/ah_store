


import 'package:ah_store/const/consts.dart';
import 'package:ah_store/controller/category_content_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../components/category_card.dart';
import '../models/all_model_req.dart';
import '../models/category_model.dart';

class CategoryContentView extends StatelessWidget {


  final List<FullCategory> childrenCategory;
  final FullCategory fullCategory;

  const CategoryContentView({Key? key , required this.childrenCategory , required this.fullCategory}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => CategoryContentController());
    Get.put(CategoryContentController());
    return GetBuilder<CategoryContentController>(
        initState: (_){
      // Get.find<CategoryContentController>().getCategoryContent();
    },
    builder: (controller) => Scaffold(
    appBar: AppBar(
    centerTitle: true,
    title: const Text('Category Content'),
    backgroundColor: Colors.purple,
    ),
       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: SingleChildScrollView(
           child: Column(
             children: [
               childrenCategory.isNotEmpty?const Text('Categories'):const SizedBox(),
               childrenCategory.isNotEmpty?GridView.builder(
                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                     maxCrossAxisExtent: 200,
                     //mainAxisExtent:150,
                     childAspectRatio: 3 / 2.8,
                     crossAxisSpacing: 16,
                     mainAxisSpacing: 20),
                 shrinkWrap: true,
                 itemCount: childrenCategory.length,
                 itemBuilder: (context , index){
                   return CategoryCard(fullCategory: childrenCategory[index]);
                 },
               ):const SizedBox(),
               fullCategory.products!.isNotEmpty?ListView.builder(
                 shrinkWrap: true,
                 itemCount: fullCategory.products!.length,
                 itemBuilder: (context , index) {
                   return Neumorphic(
                     child:Column(
                       children: [
                         Image.network(KConstants.domain + fullCategory.products![index].photo.toString()),
                       ],
                     ),
                   );
                 },
               ):SizedBox(),
             ],
           ),
         ),
       )
    )
    );
    }

}
