import 'package:ah_store/const/consts.dart';
import 'package:ah_store/controller/home_controller.dart';
import 'package:ah_store/models/all_model_req.dart';
import 'package:ah_store/view/category_content_view.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'dart:ui';

class CategoryCard extends StatelessWidget {
  final FullCategory fullCategory;
  final int fullCategoryIndex;

  const CategoryCard({Key? key, required this.fullCategory , required this.fullCategoryIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: const EdgeInsets.all(0),
      style: const NeumorphicStyle(
        color: Colors.white,
        intensity: 0.5,
        depth: 10,
      ),
      onPressed: () {
        print('99999999999');
        List<FullCategory> temp = [];

        for (var item in Get.find<HomeController>().categoryModelList) {
          if (item.parentId == fullCategory.id) {
            temp.add(item);
          }
        }

        Get.to(CategoryContentView(childrenCategory: temp , fullCategory: fullCategory, fullCategoryIndex: fullCategoryIndex,),
            preventDuplicates: false);

        // Get.to(const CategoryContentView());
      },
      child: Stack(
        children: [
          Image.network(
            KConstants.domain + fullCategory.categoryPhoto.toString(),
            fit: BoxFit.fitHeight,
            height: 153.5,

          ),

          Positioned(
            bottom: 0,
            child: Row(
              children: [
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2.5,sigmaY: 2.5),
                    child: Container(
                      color: Colors.purple.withOpacity(0.5),
                      height: 30,
                      width: 165,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(fullCategory.categoryName.toString() , style: const TextStyle(color: Colors.white),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(height: 16),
          // Text(categoryModel.categoryName.toString()),
        ],
      ),
    );
  }
}
