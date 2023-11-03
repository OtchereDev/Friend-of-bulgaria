// To parse this JSON data, do
//
//     final userRequest = userRequestFromJson(jsonString);

import 'dart:convert';

UserRequest userRequestFromJson(String str) => UserRequest.fromJson(json.decode(str));

String userRequestToJson(UserRequest data) => json.encode(data.toJson());

class UserRequest {
    String? name;
    String? password;
    String? email;
    String? phone;

    UserRequest({
         this.name,
         this.password,
         this.email,
         this.phone,
    });

    factory UserRequest.fromJson(Map<String, dynamic> json) => UserRequest(
        name: json["name"],
        password: json["password"],
        email: json["email"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "email": email,
        "phone": phone,
    };
}
