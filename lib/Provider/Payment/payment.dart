import 'package:flutter/material.dart';
import 'package:hackaton/Core/Helpers/navigation_helper.dart';
import 'package:hackaton/Model/Request/payment_request.dart';
import 'package:hackaton/Services/Remote/Payment/coupoun_services.dart';
import 'package:hackaton/Utils/Dialogs/notifications.dart';
import 'package:hackaton/View/Browser/inapp_browser.dart';

class PaypalProvider extends ChangeNotifier {
  PaypalServices paypalServices = PaypalServices();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool load) {
    _isLoading = load;
    notifyListeners();
  }

  // String? accessToken = '';
  // String? get accessTok => accessToken;

  // generateAccessToken() async {
  //   await paypalServices.getAccessToken().then((value) {
  //     // accessToken = value;
  //     notifyListeners();
  //     SharedPrefsManager().setPaymentAuthToken(value ?? "");
  //   print(value);

  //   });
  // }

  createPayment(context, PaymentRequest request) async {
    setLoading(true);
    await paypalServices
        .createPaypalPayment(context, request.toJson())
        .then((value) {
      setLoading(false);
      if (value['status'] == true) {
        for (var x in value['data']['response']['links']) {
          if (x['rel'] == "approval_url") {
            AppNavigationHelper.navigateToWidget(
                context, WebViewExample(url: x['href']!, title: 'Checkout'));
          }
        }
      } else {
        NotificationUtils.showToast(context,
            message: value['message'].toString());
      }
      // print(value);
    });
  }
}
