import 'package:ah_store/const/consts.dart';
import 'package:ah_store/controller/cart_controller.dart';
import 'package:ah_store/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class CartCard extends StatefulWidget {
  final OrderItem orderItem;

  const CartCard({Key? key, required this.orderItem}) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  double? totalPrice;
  int? quantity;

  @override
  void initState() {
    totalPrice = widget.orderItem.quantity!.toDouble() *
        double.parse(widget.orderItem.product!.price!);
    quantity = widget.orderItem.quantity!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return // Neumorphic(
        //     style: NeumorphicStyle(
        //       color: Colors.white,
        //       depth: 4,
        //       intensity: 0.5,
        //     ),
        //     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        //     padding: EdgeInsets.all(0),
        //     // child: Row(
        //     //   crossAxisAlignment: CrossAxisAlignment.start,
        //     //   children: [
        //     //     Image.network(KConstants.domain + widget.orderItem.product!.photo.toString() , height: Get.height*0.14 , width: Get.height*0.14,fit: BoxFit.fitHeight,),
        //     //     SizedBox(width: 10),
        //     //     Column(
        //     //       // todo add $ to price
        //     //       mainAxisAlignment: MainAxisAlignment.start,
        //     //       children: [
        //     //         Text(widget.orderItem.product!.productName.toString()),
        //     //         SizedBox(height: 10),
        //     //         Text(widget.orderItem.product!.price.toString()),
        //     //       ],
        //     //     ),
        //     //     Expanded(child: SizedBox()),
        //     //     Column(
        //     //       children: [
        //     //         Row(
        //     //           children: [
        //     //             IconButton(onPressed: (){
        //     //               Get.find<CartController>().changeQuantity('dec', widget.orderItem.product!);
        //     //               setState(() {
        //     //
        //     //                 if(quantity!=1){
        //     //                   quantity = quantity! -1;
        //     //                   totalPrice = widget.orderItem.quantity!.toDouble() * double.parse(widget.orderItem.product!.price!);
        //     //                 }
        //     //               });
        //     //             }, icon: Icon(Icons.remove)),
        //     //             Text(quantity.toString()),
        //     //             IconButton(onPressed: (){
        //     //               Get.find<CartController>().changeQuantity('inc', widget.orderItem.product!);
        //     //               setState(() {
        //     //                 quantity = quantity! + 1;
        //     //                 totalPrice = widget.orderItem.quantity!.toDouble() * double.parse(widget.orderItem.product!.price!);
        //     //               });
        //     //             }, icon: Icon(Icons.add_outlined)),
        //     //
        //     //           ],
        //     //         ),
        //     //         Text(totalPrice.toString()),
        //     //         ElevatedButton(onPressed: (){
        //     //           Get.find<CartController>().deleteProductFromCart(widget.orderItem);
        //     //         }, child: Icon(Icons.delete)),
        //     //       ],
        //     //     ),
        //     //
        //     //
        //     //
        //     //   ],
        //     // ),
        //   child: Container(
        //     alignment: Alignment.topLeft,
        //     color: Colors.green,
        //     child: ,
        //   )
        //
        // );
        Neumorphic(
            style: NeumorphicStyle(
              color: Colors.white,
              depth: 6,
              intensity: 0.6,
            ),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: EdgeInsets.all(0),
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: Get.width,
                margin: EdgeInsets.all(6),
                child: Row(
                  children: [
                    Container(
                      width: Get.width * 0.2,
                      child: CircleAvatar(
                        radius: 50,
                        foregroundImage: NetworkImage(KConstants.domain +
                            widget.orderItem.product!.photo.toString()),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Container(
                      width: Get.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              widget.orderItem.product!.productName.toString()),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "\$" + widget.orderItem.product!.price.toString(),
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: Get.width * 0.3,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.find<CartController>().changeQuantity(
                                    'dec', widget.orderItem.product!);
                                setState(() {
                                  if (quantity != 1) {
                                    quantity = quantity! - 1;
                                    totalPrice = widget.orderItem.quantity!
                                            .toDouble() *
                                        double.parse(
                                            widget.orderItem.product!.price!);
                                  }
                                });
                              },
                              icon: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.black, width: 1)),
                                  child: Icon(Icons.remove))),
                          Text(quantity.toString()),
                          IconButton(
                              onPressed: () {
                                Get.find<CartController>().changeQuantity(
                                    'inc', widget.orderItem.product!);
                                setState(() {
                                  quantity = quantity! + 1;
                                  totalPrice =
                                      widget.orderItem.quantity!.toDouble() *
                                          double.parse(
                                              widget.orderItem.product!.price!);
                                });
                              },
                              icon: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.black, width: 1)),
                                  child: Icon(Icons.add_outlined))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: InkWell(
                    onTap:(){ Get.find<CartController>().deleteProductFromCart(widget.orderItem);} ,
                      child: Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                    size: 30,
                  ))),
            ]));
  }
}
