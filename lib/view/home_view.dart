import 'package:ah_store/components/category_card.dart';
import 'package:ah_store/controller/global_controller.dart';
import 'package:ah_store/controller/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';



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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(Get.find<GlobalController>().userModel.balance.toString()),

                   const Text('Category',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                const SizedBox(height: 50),
                controller.homeCategoryModelList.isNotEmpty?GridView.builder(
                  shrinkWrap: true,
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
