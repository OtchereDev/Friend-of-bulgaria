// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String? message;
    Data? data;

    User({
         this.message,
         this.data,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    UserClass? user;
    String? accessToken;

    Data({
         this.user,
         this.accessToken,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: UserClass.fromJson(json["user"]),
        accessToken: json["access_token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "access_token": accessToken,
    };
}

class UserClass {
    String? id;
    String? phone;
    String? email;
    String? name;
    bool? isDeleted;
    DateTime? createdAt;
    DateTime? updatedAt;

    UserClass({
         this.id,
         this.phone,
         this.email,
         this.name,
         this.isDeleted,
         this.createdAt,
         this.updatedAt,
    });

    factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["id"],
        phone: json["phone"],
        email: json["email"],
        name: json["name"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "email": email,
        "name": name,
        "isDeleted": isDeleted,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
