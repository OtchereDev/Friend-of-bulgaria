import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotificationUtils {
  static showToast(context, {required String message, bool isError = false}) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
      
        backgroundColor: isError ? Colors.red : Colors.black,
        fontSize: 12.0);
  }
}
