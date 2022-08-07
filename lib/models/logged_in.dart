// To parse this JSON data, do
//
//     final loggedInUser = loggedInUserFromJson(jsonString);

import 'dart:convert';

LoggedInUser loggedInUserFromJson(String str) =>
    LoggedInUser.fromJson(json.decode(str));

String loggedInUserToJson(LoggedInUser data) => json.encode(data.toJson());

class LoggedInUser {
  LoggedInUser({
    required this.status,
    required this.data,
  });

  final String status;
  final Data data;

  factory LoggedInUser.fromJson(Map<String, dynamic> json) => LoggedInUser(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.phone,
    required this.password,
  });

  final int id;
  final String email;
  final String phone;
  final String password;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phone": phone,
        "password": password,
      };
}
