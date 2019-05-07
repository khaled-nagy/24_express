// To parse this JSON data, do
//
//     final choose = chooseFromJson(jsonString);

import 'dart:convert';

Choose chooseFromJson(String str) {
  final jsonData = json.decode(str);
  return Choose.fromJson(jsonData);
}

String chooseToJson(Choose data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Choose {
  List<Store> stores;

  Choose({
    this.stores,
  });

  factory Choose.fromJson(Map<String, dynamic> json) => new Choose(
    stores: new List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "stores": new List<dynamic>.from(stores.map((x) => x.toJson())),
  };
}

class Store {
  int id;
  String title;
  String titleEn;
  int type;
  String mobile;
  String email;
  String address;
  String addressAr;
  String img;
  int status;
  String password;
  int roleId;
  String rememberToken;
  String createdAt;
  String updatedAt;
  int totalPrice;

  Store({
    this.id,
    this.title,
    this.titleEn,
    this.type,
    this.mobile,
    this.email,
    this.address,
    this.addressAr,
    this.img,
    this.status,
    this.password,
    this.roleId,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.totalPrice,
  });

  factory Store.fromJson(Map<String, dynamic> json) => new Store(
    id: json["id"],
    title: json["title"],
    titleEn: json["title_en"],
    type: json["type"],
    mobile: json["mobile"],
    email: json["email"],
    address: json["address"],
    addressAr: json["address_ar"],
    img: json["img"],
    status: json["status"],
    password: json["password"],
    roleId: json["role_id"],
    rememberToken: json["remember_token"] == null ? null : json["remember_token"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    totalPrice: json["total_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "title_en": titleEn,
    "type": type,
    "mobile": mobile,
    "email": email,
    "address": address,
    "address_ar": addressAr,
    "img": img,
    "status": status,
    "password": password,
    "role_id": roleId,
    "remember_token": rememberToken == null ? null : rememberToken,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "total_price": totalPrice,
  };
}
