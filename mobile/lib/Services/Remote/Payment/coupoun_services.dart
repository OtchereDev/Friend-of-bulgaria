import 'package:hackaton/Core/Mixins/auth_base_repository.dart';
import 'package:hackaton/Core/app_constants.dart';
import 'dart:async';
import 'dart:convert';

class PaypalServices with AuthBaseRepository {
  String domain = "https://api.sandbox.paypal.com"; // for sandbox mode
//  String domain = "https://api.paypal.com"; // for production mode

  // change clientId and secret with your own, provided by paypal
  String clientId =
      'AfRVU7Mgz1W3uf-kUPs5gjUCVJDnN2jd-2PHYocDDi6lLc79glI4pn6QaKcbpaligt_oyQIxm_zDUS-t';
  String secret =
      'EOQf1T9_71ZHl86Zlk0uaJzoiOT2L2XZYoPVmp-ZkmcaAb-M7dJjyhsrRvp8xwX-shWTrhM6tbHSoZe9';

  // for getting the access token from Paypal
  // Future<String?> getAccessToken() async {
  //   try {
  //     var client = BasicAuthClient(clientId, secret);
  //     var response = await client.post(
  //         Uri.parse('$domain/v1/oauth2/token?grant_type=client_credentials'));
  //     if (response.statusCode == 200) {
  //       final body = convert.jsonDecode(response.body);
  //       return body["access_token"];
  //     }

  //     return null;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  //  @override
  Future<dynamic> createPaypalPayment(context, data) async {
    dynamic responseMap = {"status": false, "message": "", "data": null};
    await post(
      context,
      url: "$paymentUrl/payments-ticket",
      data: jsonEncode(data),
      // useContentType: true
    ).then((response) {
      // print(response?.statusCode);
      if (response != null) {
        var dataResponse = json.decode(response.body);
        if (response.statusCode == 200) {
          responseMap['status'] = true;
          responseMap['message'] = dataResponse['message'];
          responseMap['data'] = dataResponse;
        } else {
          responseMap['message'] = dataResponse['message'];
          responseMap['data'] = dataResponse;
        }
      }
    });
    return responseMap;
  }

    Future<dynamic> captureOrder(context, data) async {
    dynamic responseMap = {"status": false, "message": "", "data": null};
    // print(jsonEncode(data));
    await post(
      context,
      url: "$paymentUrl/payments-ticket-capture/$data",
      // data: jsonEncode(data),
    ).then((response) {
      if (response != null) {
        var dataResponse = json.decode(response.body);
        if (response.statusCode == 200) {
          responseMap['status'] = true;
          responseMap['message'] = dataResponse['message'];
          responseMap['data'] = dataResponse;
        } else {
          responseMap['message'] = dataResponse['message'];
          responseMap['data'] = dataResponse;
        }
      }
    });
    return responseMap;
  }


//  for executing the payment transaction
//   Future<String?> executePayment(url, payerId) async {
//     String accessToken = await SharedPrefsManager().getPaymentToken();
//     try {
//       var response = await http.post(Uri.parse(url),
//           body: convert.jsonEncode({"payer_id": payerId}),
//           headers: {
//             "content-type": "application/json",
//             'Authorization': 'Bearer ' + accessToken
//           });

//       final body = convert.jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         return body["id"];
//       }
//       return null;
//     } catch (e) {
//       rethrow;
//     }
//   }
}
