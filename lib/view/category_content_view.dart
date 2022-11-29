


import 'package:ah_store/components/product_card.dart';
import 'package:ah_store/const/consts.dart';
import 'package:ah_store/controller/category_content_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../components/category_card.dart';
import '../models/all_model_req.dart';

class CategoryContentView extends StatelessWidget {


  final List<FullCategory> childrenCategory;
  final FullCategory fullCategory;
  int fullCategoryIndex;

  CategoryContentView({Key? key , required this.childrenCategory , required this.fullCategory , required this.fullCategoryIndex}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Get.put(CategoryContentController());
    return GetBuilder<CategoryContentController>(
    builder: (controller) => Scaffold(
    appBar: AppBar(
    centerTitle: true,
    title: Text(fullCategory.categoryName.toString()),
    backgroundColor: Colors.purple,
    ),
       body: SingleChildScrollView(
         child: Column(
           children: [
             childrenCategory.isNotEmpty?Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Neumorphic(
                   margin: const EdgeInsets.only(bottom: 8 , top: 20),
                   padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                   style: NeumorphicStyle(
                     depth: -4,
                     intensity: 0.8,
                     color: Colors.white,
                     boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.only(
                       topRight: Radius.circular(20),
                       bottomRight: Radius.circular(20)
                     ))
                   ),
                   child: const Text('Categories' , style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 17 , color: Colors.black87),),
                 ),
               ],
             ):const SizedBox(),
             childrenCategory.isNotEmpty?GridView.builder(
               physics: const NeverScrollableScrollPhysics(),
               padding: EdgeInsets.all(8),
               gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                   maxCrossAxisExtent: 200,
                   //mainAxisExtent:150,
                   childAspectRatio: 3 / 2.8,
                   crossAxisSpacing: 16,
                   mainAxisSpacing: 20),
               shrinkWrap: true,
               itemCount: childrenCategory.length,
               itemBuilder: (context , index){
                 return CategoryCard(fullCategory: childrenCategory[index], fullCategoryIndex: index,);
               },
             ):const SizedBox(),
             fullCategory.products!.isNotEmpty?Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Neumorphic(
                   margin: EdgeInsets.only(bottom: 0 , top: 20),
                   padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                   style: NeumorphicStyle(
                       depth: -4,
                       intensity: 0.8,
                       color: Colors.white,
                       boxShape: NeumorphicBoxShape.roundRect(BorderRadius.only(
                           topRight: Radius.circular(20),
                           bottomRight: Radius.circular(20)
                       ))
                   ),
                   child: const Text('Products' , style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 17 , color: Colors.black87),),
                 ),
               ],
             ):SizedBox(),
             fullCategory.products!.isNotEmpty?ListView.builder(
               physics: const NeverScrollableScrollPhysics(),
               padding: EdgeInsets.all(8),
               shrinkWrap: true,
               itemCount: fullCategory.products!.length,
               itemBuilder: (context , index) {
                 return ProductCard(product: fullCategory.products![index] , categoryIndex: fullCategoryIndex , productIndex: index,);
               },
             ):SizedBox(),
           ],
         ),
       )
    )
    );
    }

}
