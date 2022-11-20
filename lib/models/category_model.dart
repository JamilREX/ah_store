

class CategoryModelReq {
  String? status;
  List<CategoryModel>? categoryModel;

  CategoryModelReq({this.status, this.categoryModel});

  CategoryModelReq.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      categoryModel = <CategoryModel>[];
      json['data'].forEach((v) {
        categoryModel!.add(new CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.categoryModel != null) {
      data['data'] = this.categoryModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryModel {
  int? categoryId;
  String? categoryName;
  String? photo;
  String? icon;
  int? parentId;
  String? parentName;

  CategoryModel(
      {this.categoryId,
        this.categoryName,
        this.photo,
        this.icon,
        this.parentId,
        this.parentName});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    photo = json['photo'];
    icon = json['icon'];
    parentId = json['parent_id'];
    parentName = json['parent_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['photo'] = this.photo;
    data['icon'] = this.icon;
    data['parent_id'] = this.parentId;
    data['parent_name'] = this.parentName;
    return data;
  }
}
