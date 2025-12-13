class UserModel {
  UserModel({
    this.name,
    this.email,
    this.token,
  });

  UserModel.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    token = json['token'];
  }
  String? name;
  String? email;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['token'] = token;
    return map;
  }

}