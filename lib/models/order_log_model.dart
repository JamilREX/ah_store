class OrderLogReq {
  String? status;
  List<OrderModel>? ordersList;

  OrderLogReq({this.status, this.ordersList});

  OrderLogReq.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      ordersList = <OrderModel>[];
      json['data'].forEach((v) {
        ordersList!.add(new OrderModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.ordersList != null) {
      data['data'] = this.ordersList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderModel {
  int? id;
  String? price;
  int? quantity;
  int? accept;
  String? createdAt;
  String? productName;
  int? productId;

  OrderModel(
      {this.id,
        this.price,
        this.quantity,
        this.accept,
        this.createdAt,
        this.productName,
        this.productId});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    quantity = json['quantity'];
    accept = json['accept'];
    createdAt = json['created_at'];
    productName = json['product_name'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['accept'] = this.accept;
    data['created_at'] = this.createdAt;
    data['product_name'] = this.productName;
    data['product_id'] = this.productId;
    return data;
  }
}
