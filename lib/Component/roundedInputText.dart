import 'package:flutter/material.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Utils/properties.dart';
class RoundedInputField extends StatelessWidget {
  final String? labelText, validateMsg;
  final String? hintText;
  // final FormFieldValidator<String> validator;
  final GestureTapCallback? onTap;
  final bool? readOnly;
  final int? maxLines;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final bool validate;
  final bool validateEmail;

  const RoundedInputField(
      {Key? key,
      this.labelText,
      this.hintText,
      // required this.validator,
      this.onTap,
      this.readOnly,
      this.focusNode,
      this.textEditingController,
      this.onChanged,
      this.validate = false,
      this.validateEmail = false,
      this.maxLines,
      required this.keyboardType,
      this.suffix,
      this.validateMsg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText!.isEmpty
            ? SizedBox.shrink()
            : Text(
                '$labelText',
                style: TextStyle(fontSize: 12),
              ),
              AppSpaces.height8
              ,
        TextFormField(
          autofocus: false,
          onTap: onTap,
          readOnly: readOnly ?? false,
          onChanged: onChanged,
          controller: textEditingController,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            fillColor: Color(0xffffffff),
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 12),
            contentPadding: EdgeInsets.only(left: 10, top: 15),
            suffixIcon: suffix,
            border: OutlineInputBorder(
              borderSide: BorderSide(color:AppColors.ASHDEEP, width: 0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.ASHDEEP, width: 0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color:AppColors.ASHDEEP, width: 0.5),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          validator: (value) {
            RegExp regex = new RegExp(PATTERN);
            if (value!.isEmpty && validate) {
              return validateMsg;
            } else if (validateEmail && !regex.hasMatch(value)) {
              return "Please enter a valid email address";
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
