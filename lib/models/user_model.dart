

import 'package:get/get.dart';

class UserModelReq {
  String? status;
  UserModel? userModel;

  UserModelReq({this.status, this.userModel});

  UserModelReq.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userModel = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (userModel != null) {
      data['data'] = userModel!.toJson();
    }
    return data;
  }
}

class UserModel extends GetxController{
  int? id;
  String? username;
  String? fullName;
  String? userType;
  String? avatar;
  String? balance;
  int? active;
  String? title;
  String? logo;
  String? token;

  UserModel(
      {this.id,
        this.username,
        this.fullName,
        this.userType,
        this.avatar,
        this.balance,
        this.active,
        this.title,
        this.logo,
        this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    fullName = json['full_name'];
    userType = json['user_type'];
    avatar = json['avatar'];
    balance = json['balance'];
    active = json['active'];
    title = json['title'];
    logo = json['logo'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['full_name'] = fullName;
    data['user_type'] = userType;
    data['avatar'] = avatar;
    data['balance'] = balance;
    data['active'] = active;
    data['title'] = title;
    data['logo'] = logo;
    data['token'] = token;
    return data;
  }
}
