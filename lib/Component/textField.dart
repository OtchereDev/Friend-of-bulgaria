import 'package:flutter/material.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Utils/properties.dart';

Widget textFormField({
  required String hintText,
  // String labelText,
  String? validateMsg,
  IconData? icon,
  Widget? prefixIcon,
  Color? iconColor,
  Color? cursorColor,
  Color? textColor = AppColors.BLACK,
  required TextEditingController controller,
  bool? validate = true,
  bool? suggestion = false,
  bool? isPhone = false,
  TextInputType? inputType = TextInputType.text,
  int? maxLine = 1,
  int? minLine = 1,
  bool? validateEmail = false,
  double? width,
  enable = false,
  bool? removeBorder = false,
  void Function()? onIconTap,
  TextInputAction? inputAction,
  // void Function()? onEditingComplete,
  EdgeInsets? padding = const EdgeInsets.only(left: 10, top: 0),
  required FocusNode? focusNode,
}) {
  return TextFormField(
    readOnly: enable,
    enableSuggestions: suggestion!,
    keyboardType: inputType,
    controller: controller,
    minLines: minLine,
    maxLines: maxLine,
    focusNode: focusNode,
    autofocus: false,
    textInputAction: inputAction,
    cursorColor: cursorColor,
    style: TextStyle(
      color: textColor,
    ),
    decoration: InputDecoration(
      hintText: hintText,
      contentPadding: padding,
      hintStyle: TextStyle(fontSize: 12),
      labelStyle: const TextStyle(color: AppColors.ASHDEEP),
      prefixStyle: const TextStyle(color: Colors.grey),
      prefixIcon: prefixIcon,
      suffixIcon: icon == null
          ? null
          : GestureDetector(
              onTap: onIconTap,
              child: Icon(icon, color: iconColor),
            ),
      enabledBorder: InputBorder.none,
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorStyle: const TextStyle(
        color: Colors.red,
      ),
    ),
    validator: (value) {
      RegExp regex = new RegExp(PATTERN);
      if (value!.isEmpty && validate!) {
        return validateMsg;
      } else if (validateEmail! && !regex.hasMatch(value)) {
        return "Please enter a valid email address";
      } else if (isPhone! && controller.text.length < 9) {
        return "Please enter a valid phone number";
      }
      return null;
    },
  );
}
