// To parse this JSON data, do
//
//     final paymentRequest = paymentRequestFromJson(jsonString);

import 'dart:convert';

PaymentRequest paymentRequestFromJson(String str) => PaymentRequest.fromJson(json.decode(str));

String paymentRequestToJson(PaymentRequest data) => json.encode(data.toJson());

class PaymentRequest {
    String? email;
    String? phone;
    String? address;
    String? eventId;

    PaymentRequest({
         this.email,
         this.phone,
         this.address,
         this.eventId,
    });

    factory PaymentRequest.fromJson(Map<String, dynamic> json) => PaymentRequest(
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        eventId: json["eventId"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "phone": phone,
        "address": address,
        "eventId": eventId,
    };
}
