// // To parse this JSON data, do
// //
// //     final paymentResponse = paymentResponseFromJson(jsonString);

// import 'dart:convert';

// PaymentResponse paymentResponseFromJson(String str) => PaymentResponse.fromJson(json.decode(str));

// String paymentResponseToJson(PaymentResponse data) => json.encode(data.toJson());

// class PaymentResponse {
//     String id;
//     String status;
//     PaymentSource paymentSource;
//     Payer payer;

//     PaymentResponse({
//         required this.id,
//         required this.status,
//         required this.paymentSource,
//         required this.payer,
//     });

//     factory PaymentResponse.fromJson(Map<String, dynamic> json) => PaymentResponse(
//         id: json["id"],
//         status: json["status"],
//         paymentSource: PaymentSource.fromJson(json["payment_source"]),
//         payer: Payer.fromJson(json["payer"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "status": status,
//         "payment_source": paymentSource.toJson(),
//         "payer": payer.toJson(),
//     };
// }

// class Payer {
//     Name name;
//     String emailAddress;
//     Phone phone;

//     Payer({
//         required this.name,
//         required this.emailAddress,
//         required this.phone,
//     });

//     factory Payer.fromJson(Map<String, dynamic> json) => Payer(
//         name: Name.fromJson(json["name"]),
//         emailAddress: json["email_address"],
//         phone: Phone.fromJson(json["phone"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name.toJson(),
//         "email_address": emailAddress,
//         "phone": phone.toJson(),
//     };
// }

// class Name {
//     String givenName;
//     String surname;

//     Name({
//         required this.givenName,
//         required this.surname,
//     });

//     factory Name.fromJson(Map<String, dynamic> json) => Name(
//         givenName: json["given_name"],
//         surname: json["surname"],
//     );

//     Map<String, dynamic> toJson() => {
//         "given_name": givenName,
//         "surname": surname,
//     };
// }

// class Phone {
//     String phoneType;
//     PhoneNumber phoneNumber;

//     Phone({
//         required this.phoneType,
//         required this.phoneNumber,
//     });

//     factory Phone.fromJson(Map<String, dynamic> json) => Phone(
//         phoneType: json["phone_type"],
//         phoneNumber: PhoneNumber.fromJson(json["phone_number"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "phone_type": phoneType,
//         "phone_number": phoneNumber.toJson(),
//     };
// }

// class PhoneNumber {
//     String nationalNumber;

//     PhoneNumber({
//         required this.nationalNumber,
//     });

//     factory PhoneNumber.fromJson(Map<String, dynamic> json) => PhoneNumber(
//         nationalNumber: json["national_number"],
//     );

//     Map<String, dynamic> toJson() => {
//         "national_number": nationalNumber,
//     };
// }

// class PaymentSource {
//     Paypal paypal;

//     PaymentSource({
//         required this.paypal,
//     });

//     factory PaymentSource.fromJson(Map<String, dynamic> json) => PaymentSource(
//         paypal: Paypal.fromJson(json["paypal"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "paypal": paypal.toJson(),
//     };
// }

// class Paypal {
//     String emailAddress;
//     Name name;
//     String phoneType;
//     PhoneNumber phoneNumber;

//     Paypal({
//         required this.emailAddress,
//         required this.name,
//         required this.phoneType,
//         required this.phoneNumber,
//     });

//     factory Paypal.fromJson(Map<String, dynamic> json) => Paypal(
//         emailAddress: json["email_address"],
//         name: Name.fromJson(json["name"]),
//         phoneType: json["phone_type"],
//         phoneNumber: PhoneNumber.fromJson(json["phone_number"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "email_address": emailAddress,
//         "name": name.toJson(),
//         "phone_type": phoneType,
//         "phone_number": phoneNumber.toJson(),
//     };
// }
