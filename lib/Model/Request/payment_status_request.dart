// To parse this JSON data, do
//
//     final paymentStatus = paymentStatusFromJson(jsonString);

import 'dart:convert';

PaymentStatus paymentStatusFromJson(String str) => PaymentStatus.fromJson(json.decode(str));

String paymentStatusToJson(PaymentStatus data) => json.encode(data.toJson());

class PaymentStatus {
    String eventId;
    String paymentId;
    String payerId;

    PaymentStatus({
        required this.eventId,
        required this.paymentId,
        required this.payerId,
    });

    factory PaymentStatus.fromJson(Map<String, dynamic> json) => PaymentStatus(
        eventId: json["eventId"],
        paymentId: json["paymentId"],
        payerId: json["payerId"],
    );

    Map<String, dynamic> toJson() => {
        "eventId": eventId,
        "paymentId": paymentId,
        "payerId": payerId,
    };
}
