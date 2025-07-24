
import 'dart:convert';

List<UserData> userDataFromJson(String str) => List<UserData>.from(json.decode(str).map((x) => UserData.fromJson(x)));

String userDataToJson(List<UserData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserData {
  String id;
  String name;
  int contact;
  String email;
  String address;
  int v;

  UserData({
    required this.id,
    required this.name,
    required this.contact,
    required this.email,
    required this.address,
    required this.v,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["_id"],
    name: json["name"],
    contact: json["contact"],
    email: json["email"],
    address: json["address"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "contact": contact,
    "email": email,
    "address": address,
    "__v": v,
  };
}
