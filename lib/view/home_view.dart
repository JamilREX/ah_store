import 'dart:io';

import 'package:ah_store/components/category_card.dart';
import 'package:ah_store/controller/global_controller.dart';
import 'package:ah_store/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';



class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    Get.lazyPut(() => HomeController());

    return GetBuilder<HomeController>(
      initState: (_){
       Get.find<HomeController>().getCategories();
      },
      builder: (controller) => Scaffold(
       //backgroundColor: Colors.grey,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home'),
          backgroundColor: Colors.purple,
        ),
      //  drawer: MyDrawer(),
        body: Obx(() => controller.loading.value==true?const Center(child: CircularProgressIndicator()):SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // controller.file==null?SizedBox():Image.file(controller.file!),
                // ElevatedButton(onPressed: (){
                //   controller.getImage();
                // }, child: Text('get img')),



                Neumorphic(
                     margin: const EdgeInsets.only(bottom: 8 , top: 20),
                     padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                     style: NeumorphicStyle(
                         depth: -4,
                         intensity: 0.8,
                         color: Colors.white,
                         boxShape: NeumorphicBoxShape.roundRect( BorderRadius.circular(20
                             // topRight: Radius.circular(20),
                             // bottomRight: Radius.circular(20)
                         ))
                     ),
                     child: const Text('Categories' , style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 17 , color: Colors.black87),),
                   ),
                const SizedBox(height: 20),
                controller.homeCategoryModelList.isNotEmpty?GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.homeCategoryModelList.length,
                  itemBuilder: (context , index){
                    return CategoryCard(fullCategory: controller.homeCategoryModelList[index],fullCategoryIndex:index);
                  }, gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    //mainAxisExtent:150,
                    childAspectRatio: 3 / 2.8,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 20),




                ):const SizedBox()

              ],
            ),
          ),
        )),

                // ListView.builder(
                //     physics: const BouncingScrollPhysics(),
                //     itemCount: 5,
                //     itemBuilder: (context,i){
                //       return Stack(
                //           children: [InkWell(
                //             onTap: (){
                //               Get.to(const Lab());
                //             },
                //             child: Container(
                //               height: 200,
                //               width: double.infinity,
                //               margin: const EdgeInsets.all(15),
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(15),
                //                 color: Colors.white,
                //                 boxShadow: [
                //                   BoxShadow(
                //                       blurStyle: BlurStyle.solid,
                //                       blurRadius: 10.0,
                //                       color: Colors.black12.withAlpha(30)
                //                   ),
                //                 ],
                //               ),
                //               child: Text(controller.userModel.fullName.toString()),
                //             ),
                //           ),
                //             Positioned(
                //               child: Container(
                //                 child: Image.network('https://freesvg.org/img/metalmarious_Laptop.png'),
                //                 width: 175,
                //                 height: 150,
                //                 // color: Colors.green,
                //               ),
                //               top: 39,
                //               left: 25,),
                //             Positioned(
                //                 top: 50,
                //                 right: 35,
                //                 child: Column(
                //                   children: [
                //                     const Text("Labtop hp"),
                //                     const Text("*******"),
                //
                //                   ],
                //                 ))
                //           ]
                //       );
                //     }),
        ),
      );

  }
}
class Lab extends StatelessWidget {
  const Lab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
