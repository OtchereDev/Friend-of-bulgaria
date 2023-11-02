import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hackaton/AppTheme/app_config.dart';


class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.fieldKey,
    @required this.hintText,
    this.onSaved,
    this.validate = false,
    this.removeBorder = false,
    this.onFieldSubmitted,
    required this.controller,
    required this.validateMsg,
    this.focusNode,
    required this.inputType,
    this.title,
    this.rightWidget,
      this.count,

  });
  final Key? fieldKey;
  final String? hintText, title, validateMsg;
  final FormFieldSetter<String>? onSaved;
  final bool? validate, removeBorder;
  final ValueChanged<String>? onFieldSubmitted;
  final TextEditingController controller;
  final TextInputType? inputType;
  final Widget? rightWidget;
  final int? count;


  final FocusNode? focusNode;
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  bool isActive = true;
  // bool _isPasswordMoreThanEight = false;
  // bool _hasNumber = false;

  // @override
  // void initState() {
  //   super.initState();
  //   widget.controller.addListener(() {
  //     // final regEx = RegExp(r'(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$@!%&*?])');
  //     // if (mounted) {
  //     //   setState(() {
         
  //     //     if (widget.controller.text.length >= 8) {
  //     //       _isPasswordMoreThanEight = true;
  //     //     }
  //     //     // _hasNumber = false;
  //     //     // if (regEx.hasMatch(widget.controller.text)) {
  //     //     //   _hasNumber = true;
  //     //     // }
  //     //   });
  //     // }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title ?? "",
     style: TextStyle(fontSize: 12),
            ),
            widget.rightWidget ?? const SizedBox.shrink()
          ],
        ),
      widget.rightWidget == null ?   const SizedBox(
          height: 10,
        ): const SizedBox.shrink(),
        TextFormField(
          key: widget.fieldKey,
          obscureText: _obscureText,
          onSaved: widget.onSaved,
          keyboardType: widget.inputType,
          maxLength: widget.count,
          
          validator: (value) {
            if (value!.isEmpty && widget.validate!) {
              return widget.validateMsg;
            }
            // if (!_hasNumber && widget.validate!) {
            //   return "Password must have at least one special charater ";
            // }
            // if (!_isPasswordMoreThanEight && widget.validate!) {
            //   return "Password must be atleast eight characters";
            // }
            return null;
          },
          onFieldSubmitted: widget.onFieldSubmitted,
          controller: widget.controller,
          // style: TextStyle(color: Color(0xffF7F7F7)),
          decoration: InputDecoration(
            counterText: "",
            filled: true,
            fillColor:  Colors.white,
            contentPadding: const EdgeInsets.only(left: 10, top: 15),
            hintText: widget.hintText,
            focusColor: const Color(0xffF7F7F7),
            prefixIcon: const Padding(
              padding: EdgeInsets.all(14.0),
              child: 
              Icon(FeatherIcons.lock, color: AppColors.ASHDEEP,)
            ),

            labelStyle: const TextStyle(color: AppColors.ASHDEEP),
            // contentPadding: EdgeInsets.only(left: 10),
            hintStyle:  TextStyle(
              fontSize: 12
            ),

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
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: _obscureText
                    ? const Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Icon(
                          FeatherIcons.eye,
                          color: AppColors.ASHDEEP,
                        ))
                    : const Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Icon(
                          FeatherIcons.eyeOff,
                          color: AppColors.ASHDEEP,
                        ))),
          ),
        ),
      ],
    );
  }
}
