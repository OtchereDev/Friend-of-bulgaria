class PaymentRequest {

   String? title;
   String? location;
   String? locationCoordinate;
   String? eventDate;
   String? details;
   String? displayImg;
   String? createdAt;
   String? updatedAt;
   String? payerName;
   String? ticketType;
   int? eventQuantity;
   dynamic totalAmount;

  PaymentRequest({

    this.title,
    this.location,
    this.locationCoordinate,
    this.eventDate,
    this.details,
    this.displayImg,
    this.createdAt,
    this.updatedAt,
    this.payerName,
    this.ticketType,
    this.eventQuantity,
    this.totalAmount,
  });

  factory PaymentRequest.fromJson(Map<String, dynamic> json) {
    return PaymentRequest(

      title: json['title'],
      location: json['location'],
      locationCoordinate: json['locationCoordinate'],
      eventDate: json['eventDate'],
      details: json['details'],
      displayImg: json['displayImg'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      payerName: json['payerName'],
      ticketType: json['ticketType'],
      eventQuantity: json['eventQuantity'],
      totalAmount: json['totalAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'location': location,
      'locationCoordinate': locationCoordinate,
      'eventDate': eventDate,
      'details': details,
      'displayImg': displayImg,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'payerName': payerName,
      'ticketType': ticketType,
      'eventQuantity': eventQuantity,
      'totalAmount': totalAmount,
    };
  }
}
