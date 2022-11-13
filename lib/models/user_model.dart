

class UserModelReq {
  String? status;
  UserModel? userModel;

  UserModelReq({this.status, this.userModel});

  UserModelReq.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userModel = json['data'] != null ? new UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.userModel != null) {
      data['data'] = this.userModel!.toJson();
    }
    return data;
  }
}

class UserModel {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['full_name'] = this.fullName;
    data['user_type'] = this.userType;
    data['avatar'] = this.avatar;
    data['balance'] = this.balance;
    data['active'] = this.active;
    data['title'] = this.title;
    data['logo'] = this.logo;
    data['token'] = this.token;
    return data;
  }
}
