import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class UtilPovider extends ChangeNotifier {
  // UtilServices _utilServices = UtilServices();
  String _countryCode = "GB";
  String get countryCode => _countryCode;

  String _countryNumber = "44";
  String get countrNumber => _countryNumber;

  String _currency = "GH₵";
  String get currency => _currency;
  String? _position;
  String? get posi => _position;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setCurrency(String curr) {
    _currency = curr;
    notifyListeners();
  }

  setCountryNumber(String number) {
    _countryNumber = number;
    notifyListeners();
  }

  dynamic _prediction = [];
  dynamic get predictions => _prediction;

  setCountry(String c) {
    _countryCode = c;
    notifyListeners();
  }

  setLoading(bool load) {
    _isLoading = load;
    notifyListeners();
  }



  // Future<void> fetchPredictions(context, String input) async {
  //   await _utilServices.fetchPredictions(context, input).then((value) {
  //     _prediction = (value);
  //     notifyListeners();
  //   });
  // }

  
}
