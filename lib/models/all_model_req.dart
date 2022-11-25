class AllModelReq {
  String? status;
  AllModel? allModel;

  AllModelReq({this.status, this.allModel});

  AllModelReq.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    allModel = json['data'] != null ? AllModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (allModel != null) {
      data['data'] = allModel!.toJson();
    }
    return data;
  }
}

class AllModel {
  List<FullCategory>? fullCategoryList;
  String? storeName;
  String? storeLogo;
  List<TransferWay>? transferWay;
  List<Connection>? connection;
  String? currencyCode;

  AllModel(
      {this.fullCategoryList,
      this.storeName,
      this.storeLogo,
      this.transferWay,
      this.connection,
      this.currencyCode});

  AllModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      fullCategoryList = <FullCategory>[];
      json['products'].forEach((v) {
        fullCategoryList!.add(FullCategory.fromJson(v));
      });
    }
    storeName = json['storeName'];
    storeLogo = json['storeLogo'];
    if (json['transferWay'] != null) {
      transferWay = <TransferWay>[];
      json['transferWay'].forEach((v) {
        transferWay!.add(TransferWay.fromJson(v));
      });
    }
    if (json['connection'] != null) {
      connection = <Connection>[];
      json['connection'].forEach((v) {
        connection!.add(Connection.fromJson(v));
      });
    }
    currencyCode = json['currencyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fullCategoryList != null) {
      data['products'] = fullCategoryList!.map((v) => v.toJson()).toList();
    }
    data['storeName'] = storeName;
    data['storeLogo'] = storeLogo;
    if (transferWay != null) {
      data['transferWay'] = transferWay!.map((v) => v.toJson()).toList();
    }
    if (connection != null) {
      data['connection'] = connection!.map((v) => v.toJson()).toList();
    }
    data['currencyCode'] = currencyCode;
    return data;
  }
}

class FullCategory {
  int? id;
  int? parentId;
  String? categoryName;
  String? categoryPhoto;
  List<Products>? products;

  FullCategory({this.id, this.categoryName, this.categoryPhoto, this.products , this.parentId});

  FullCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    categoryName = json['category_name'];
    categoryPhoto = json['category_photo'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent_id'] = parentId;
    data['category_name'] = categoryName;
    data['category_photo'] = categoryPhoto;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  int? categoryId;
  String? productName;
  String? description;
  String? price;
  String? offerPrice;
  String? type;
  String? photo;
  int? favoriteCount;
  List<Requires>? requires;

  Products(
      {this.id,
      this.categoryId,
      this.productName,
      this.description,
      this.price,
      this.offerPrice,
      this.type,
      this.photo,
      this.favoriteCount,
      this.requires});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    productName = json['product_name'];
    description = json['description'];
    price = json['price'];
    offerPrice = json['offer_price'];
    type = json['type'];
    photo = json['photo'];
    favoriteCount = json['favorite_count'];
    if (json['requires'] != null) {
      requires = <Requires>[];
      json['requires'].forEach((v) {
        requires!.add(Requires.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['product_name'] = productName;
    data['description'] = description;
    data['price'] = price;
    data['offer_price'] = offerPrice;
    data['type'] = type;
    data['photo'] = photo;
    data['favorite_count'] = favoriteCount;
    if (requires != null) {
      data['requires'] = requires!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Requires {
  int? id;
  int? productId;
  String? name;
  String? question;

  Requires({this.id, this.productId, this.name, this.question});

  Requires.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['name'] = name;
    data['question'] = question;
    return data;
  }
}

class TransferWay {
  String? name;
  String? info;

  TransferWay({this.name, this.info});

  TransferWay.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['info'] = info;
    return data;
  }
}

class Connection {
  String? name;
  String? info;

  Connection({this.name, this.info});

  Connection.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['info'] = info;
    return data;
  }
}
