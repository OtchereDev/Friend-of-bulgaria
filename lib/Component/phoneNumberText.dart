// ignore_for_file: must_be_immutable

import 'package:country_pickers/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Component/textField.dart';
import 'package:hackaton/Provider/Util/util_provider.dart';
import 'package:provider/provider.dart';

// String countryCode = "233", countryName = "GH";

Widget _buildDropdownItem(Country country) => Container(
      color: Color(0xffFBFBFB),
      child: Row(
        children: [
          CountryPickerUtils.getDefaultFlagImage(country),
          Text(
            " (+${country.phoneCode})",
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );

class PhoneNumberTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText,labelText;
  VoidCallback? onIConTap;
  bool ? validate;
  bool? remove = false;
  final FocusNode? focus;
  EdgeInsets? padding;
  IconData? icon;

  PhoneNumberTextField(
      {required this.controller,
      this.focus,
      this.hintText,
      this.remove,
      this.validate,
      this.icon,
      this.onIConTap,
      this.padding, this.labelText});

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  @override
  Widget build(BuildContext context) {
    List<Country> list = [
      Country(iso3Code: "GBR", name: "UK", isoCode: "GB", phoneCode: "44"),
      Country(iso3Code: "GHA", name: "Ghana", isoCode: "GH", phoneCode: "233"),
      Country(iso3Code: "USA", name: "USA", isoCode: "US", phoneCode: "1"),
      Country(
          iso3Code: "NGA", name: "Nigeria", isoCode: "NG", phoneCode: "234"),
      Country(
          iso3Code: "SEN", name: "Senegal", isoCode: "SE", phoneCode: "221"),
    ];
    return Consumer<UtilPovider>(
      builder: (context, util, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           widget.labelText!.isEmpty ? SizedBox.shrink(): Text('${widget.labelText}', style: TextStyle(fontSize: 12),),
  AppSpaces.height8,
            Container(
                padding: EdgeInsets.only(left: 4, right: 4),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFB),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 0.5,
                    color: Colors.black,
                  ),
                ),
                child: Row(
                  children: [
                    CountryPickerDropdown(
                      initialValue: util.countryCode,
                      itemBuilder: _buildDropdownItem,
                      priorityList: list,
                      // itemFilter: (c) => ["GH", "NG", "US", "GB"].contains(c.isoCode),
                      sortComparator: (Country a, Country b) =>
                          a.isoCode.compareTo(b.isoCode),
                      onValuePicked: (Country country) {
                        util.setCountryNumber(country.phoneCode);
                        util.setCountry(country.isoCode);
                        //countryCode);
                      },
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        color: Color(0xfffffffff),
                        child: textFormField(
                            hintText: widget.hintText??"",
                            controller: widget.controller,
                            removeBorder: true,
                            focusNode: widget.focus,
                            validate: widget.validate ?? false,
                            validateMsg: "Phone number required",
                            isPhone: true,
                            inputType: TextInputType.phone,
                            icon: widget.icon,
                            onIconTap: widget.onIConTap,
                            iconColor: AppColors.SECONDARYCOLOR,
                            padding: widget.padding),
                      ),
                    )
                  ],
                )),
          ],
        );
      }
    );
  }
}
