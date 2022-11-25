

class CategoryModelReq {
  String? status;
  List<CategoryModel>? categoryModel;

  CategoryModelReq({this.status, this.categoryModel});

  CategoryModelReq.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      categoryModel = <CategoryModel>[];
      json['data'].forEach((v) {
        categoryModel!.add(CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (categoryModel != null) {
      data['data'] = categoryModel!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['photo'] = photo;
    data['icon'] = icon;
    data['parent_id'] = parentId;
    data['parent_name'] = parentName;
    return data;
  }
}
