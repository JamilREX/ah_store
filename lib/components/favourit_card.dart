import 'package:ah_store/models/all_model_req.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../const/consts.dart';
import '../controller/cart_controller.dart';

class FavouritCard extends StatefulWidget {
  final Products product;

  const FavouritCard({Key? key, required this.product}) : super(key: key);

  @override
  State<FavouritCard> createState() => _FavouritCardState();
}

class _FavouritCardState extends State<FavouritCard> {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        color: Colors.white,
        depth: 3,
        intensity: 0.3,
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.all(0),
      // child: Row(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Image.network(
      //       KConstants.domain + widget.product!.photo.toString(),
      //       height: Get.height * 0.14,
      //       width: Get.height * 0.14,
      //       fit: BoxFit.fitHeight,
      //     ),
      //     SizedBox(width: 10),
      //     Column(
      //       //
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: [
      //         Text(widget.product!.productName.toString()),
      //         SizedBox(height: 10),
      //        // Text(widget.product!.price.toString()),
      //       ],
      //     ),
      //     Icon(Icons.details),
      //   ],
      // ),
    );
    ;
  }
}
