class OrderDetailsReq {
  String? status;
  OrderDetails? orderDetails;
  OrderDetailsReq({this.status, this.orderDetails});
  OrderDetailsReq.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    orderDetails = json['data'] != null ? new OrderDetails.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.orderDetails != null) {
      data['data'] = this.orderDetails!.toJson();
    }
    return data;
  }
}

class OrderDetails {
  int? id; //done
  int? price;
  int? quantity;
  String? data; //done
  int? accept;
  String? createdAt;
  String? productName;
  int? productId;
  String? replay;
  String? replayTitle;

  OrderDetails(
      {this.id,
        this.price,
        this.quantity,
        this.data,
        this.accept,
        this.createdAt,
        this.productName,
        this.productId,
        this.replay,
        this.replayTitle});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    quantity = json['quantity'];
    data = json['data'];
    accept = json['accept'];
    createdAt = json['created_at'];
    productName = json['product_name'];
    productId = json['product_id'];
    replay = json['replay'];
    replayTitle = json['replay_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['data'] = this.data;
    data['accept'] = this.accept;
    data['created_at'] = this.createdAt;
    data['product_name'] = this.productName;
    data['product_id'] = this.productId;
    data['replay'] = this.replay;
    data['replay_title'] = this.replayTitle;
    return data;
  }
}
