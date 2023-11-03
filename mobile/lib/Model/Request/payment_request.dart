// To parse this JSON data, do
//
//     final paymentRequest = paymentRequestFromJson(jsonString);


class PaymentRequest {
    String? email;
    String? eventName;
    double? ticketPrice;
    int? ticketQuantity;
    String? ticketType;
    String? phone;
    String? address;
    String? name;

    PaymentRequest({
        this.email,
        this.eventName,
        this.ticketPrice,
        this.ticketQuantity,
        this.ticketType,
        this.phone,
        this.address,
        this.name,
    });

    factory PaymentRequest.fromJson(Map<String, dynamic> json) => PaymentRequest(
        email: json["email"],
        eventName: json["eventName"],
        ticketPrice: json["ticketPrice"],
        ticketQuantity: json["ticketQuantity"],
        ticketType: json["ticketType"],
        phone: json["phone"],
        address: json["address"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "eventName": eventName,
        "ticketPrice": ticketPrice,
        "ticketQuantity": ticketQuantity,
        "ticketType": ticketType,
        "phone": phone,
        "address": address,
        "name": name,
    };
}
