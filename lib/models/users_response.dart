class UsersResponseData {
  String? status;
  num? code;
  int? total;
  List<User>? data;

  UsersResponseData({this.status, this.code, this.total, this.data});

  UsersResponseData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    total = json['total'];
    if (json['data'] != null) {
      data = <User>[];
      json['data'].forEach((v) {
        data!.add(User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['total'] = total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? uuid;
  String? firstname;
  String? lastname;
  String? username;
  String? password;
  String? email;
  String? ip;
  String? macAddress;
  String? website;
  String? image;

  User(
      {this.id,
      this.uuid,
      this.firstname,
      this.lastname,
      this.username,
      this.password,
      this.email,
      this.ip,
      this.macAddress,
      this.website,
      this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    ip = json['ip'];
    macAddress = json['macAddress'];
    website = json['website'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['username'] = username;
    data['password'] = password;
    data['email'] = email;
    data['ip'] = ip;
    data['macAddress'] = macAddress;
    data['website'] = website;
    data['image'] = image;
    return data;
  }
}
