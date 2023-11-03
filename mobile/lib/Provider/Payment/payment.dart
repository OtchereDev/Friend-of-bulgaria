import 'package:flutter/material.dart';
import 'package:hackaton/Core/Helpers/navigation_helper.dart';
import 'package:hackaton/Model/Request/payment_request.dart';
import 'package:hackaton/Services/Local/shared_prefs_manager.dart';
import 'package:hackaton/Services/Remote/Payment/coupoun_services.dart';
import 'package:hackaton/Utils/Dialogs/notifications.dart';
import 'package:hackaton/View/Browser/inapp_browser.dart';
import 'package:hackaton/View/succes_payment.dart';

class PaypalProvider extends ChangeNotifier {
  PaypalServices paypalServices = PaypalServices();
  final sharedPrefsManager = SharedPrefsManager();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  PaymentRequest _paymentRequest = PaymentRequest();
  PaymentRequest get paymentRequest => _paymentRequest;

  // Paym

  String? _ticketId;
  String? get ticketID => _ticketId;

  setTicketId(String id) {
    _ticketId = id;
    notifyListeners();
  }

  setLoading(bool load) {
    _isLoading = load;
    notifyListeners();
  }

  setPaymentRequest(PaymentRequest pay) {
    _paymentRequest = pay;
    notifyListeners();
  }

  createPayment(context, PaymentRequest request) async {
    setLoading(true);
    await paypalServices
        .createPaypalPayment(context, request.toJson())
        .then((value) async {
      setLoading(false);
      print(value['data']);
      if (value['status'] == true) {
        setTicketId(value['data']['id']);
        for (var x in value['data']['links']) {
          if (x['rel'] == "payer-action") {
            var status = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        WebViewExample(url: x['href']!, title: '')));
            if (status != null) {
              AppNavigationHelper.setRootOldWidget(context, SuccesPayment());
            }
          }
        }
      } else {
        NotificationUtils.showToast(context,
            message: value['message'].toString());
      }
      // print(value);
    });
  }

  captureOrder(context) async {
    setLoading(true);
    await paypalServices.captureOrder(context, _ticketId).then((value) {
      setLoading(false);
      print(value);
    });
  }

  
}
