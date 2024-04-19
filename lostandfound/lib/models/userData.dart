//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.phone,
    this.otp,
    this.type,
  });

  String otp;
  String phone;
  String type;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        phone: json["phone"] ?? "",
        otp: json["otp"] ?? "",
        type: json["type"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "otp": otp,
        "type": type,
      };
}
