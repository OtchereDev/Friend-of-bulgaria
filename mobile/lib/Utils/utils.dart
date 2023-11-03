import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackaton/Core/Enums/enums.dart';

class Utils {
  static double screenWidth(context) => MediaQuery.of(context).size.width;
  static double screenHeight(context) => MediaQuery.of(context).size.height;

  static Future<String> convertImageToBase64(String imageAsset) async {
    ByteData bytes = await rootBundle.load(imageAsset);
    var buffer = bytes.buffer;
    return base64.encode(Uint8List.view(buffer));
  }

   static ScreenSize screenSize(BuildContext context) {
    return screenHeight(context) <= 500
        ? ScreenSize.small
        : screenHeight(context) > 500 && screenHeight(context) <= 786
            ? ScreenSize.medium
            : ScreenSize.large;
  }

  static int daysBetweenDates(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

}
