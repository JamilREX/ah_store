import 'package:ah_store/const/consts.dart';
import 'package:ah_store/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';


class CategoryCard extends StatelessWidget {

  final CategoryModel categoryModel;


  const CategoryCard({Key? key , required this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: (){
        
      },
      child: Column(
        children: [
          Image.network(KConstants.domain + categoryModel.photo.toString()),
          const SizedBox(height: 16),
          Text(categoryModel.categoryName.toString()),
        ],
      ),
    );
  }
}
