import 'dart:convert';

import 'all_model_req.dart';

class CartModel {
  List<OrderItem> orderItems = [];


  CartModel({required this.orderItems});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (orderItems != null) {
      data['order_items'] = orderItems.map((v) => v.toJson()).toList();
    }
    return data;
  }


  CartModel.fromJson(Map<String, dynamic> json){
    if(json['order_items']!=null){
      orderItems = <OrderItem>[];
      json['order_items'].forEach((v){
        orderItems.add(OrderItem.fromJson(v));
      });
    }
  }

}

class OrderItem {
  int? quantity =1;
  int? productId;
  Products? product;
  Map<String , dynamic>? dataa;
  OrderItem({this.quantity = 1, this.productId , this.product , this.dataa});

  OrderItem.fromJson(Map<String, dynamic> json){
    quantity = json['quantity'];
    productId = json['product_id'];
    product = Products.fromJson(json['product']);
    dataa = jsonDecode(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quantity'] = quantity;
    data['product_id'] = productId;
    data['product'] = product!.toJson();
    data['data'] = jsonEncode(dataa);
    return data;
  }
}
