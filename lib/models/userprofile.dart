// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
    UserProfile({
        required this.id,
        required this.email,
        required this.phone,
        required this.password,
    });

    final int id;
    final String email;
    final String phone;
    final String password;

    factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
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
