import 'package:flutter/material.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Component/passwordField.dart';
import 'package:hackaton/Component/phoneNumberText.dart';
import 'package:hackaton/Component/roundedInputText.dart';
import 'package:hackaton/Core/Helpers/navigation_helper.dart';
import 'package:hackaton/Model/Request/user_request.dart';
import 'package:hackaton/View/Auth/login.dart';
import 'package:hackaton/View/Auth/register.dart';
import 'package:hackaton/View/Home/base_home.dart';
import 'package:hackaton/View/Onboarding/onboarding.dart';

class GetStarted extends StatelessWidget {
  GetStarted({super.key});
  final _scaffoldKey = GlobalKey<FormState>();

  final fullNamecontroller = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
      ),
      // appBar: PreferredSize(preferredSize: Size(Utils.screenWidth(context), 50), child: CustomAppBar(title: '')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Get started",
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
          ),
          AppSpaces.height16,
          Text(
            "Stay abreast with upcoming events and purchase tickets super easily",
            style: TextStyle(fontSize: 12),
          ),
          Expanded(
            child: Form(
              key: _scaffoldKey,
              child: Column(
                children: [
                  AppSpaces.height20,
                  RoundedInputField(
                    keyboardType: TextInputType.text,
                    hintText: 'Enter fullname',
                    labelText: 'Fullname',
                    textEditingController: fullNamecontroller,
                    validate: true,
                    validateMsg: 'Name is required',
                  ),
                  AppSpaces.height20,
                  RoundedInputField(
                    keyboardType: TextInputType.text,
                    hintText: 'Enter Email',
                    labelText: 'Email',
                    textEditingController: emailController,
                    validate: true,
                    validateMsg: 'Email is required',
                  ),
                  AppSpaces.height20,
                  PhoneNumberTextField(
                    controller: phoneController,
                    hintText: 'Phone number',
                    labelText: 'Phone number',
                    validate: true,
                  ),
                  AppSpaces.height20,
                  PasswordField(
                    controller: passwordController,
                    hintText: 'Password',
                    title: 'Password',
                    inputType: TextInputType.text,
                    validateMsg: 'Password required',
                    validate: true,
                  ),
                  AppSpaces.height20,
                ],
              ),
            ),
          ),
          AppSpaces.height16,
          CustomButton(
            name: 'Create Account',
            onTap: () {
              if (_scaffoldKey.currentState?.validate() == true) {
                UserRequest _user = UserRequest();
                _user.email = emailController.text;
                _user.password = passwordController.text;
                _user.phone = phoneController.text;
                _user.name = fullNamecontroller.text;
                // authProvider.signUp(context, _user);
                // AppNavigationHelper.navigateToWidget(
                //     context, RegisterPage());
              }
            },
          ),
          AppSpaces.height8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    AppNavigationHelper.navigateToWidget(context, LoginPage());
                  },
                  child: const Text(
                    "Login instead",
                    style: TextStyle(color: AppColors.PRIMARYCOLOR),
                  )),
              Container(
                height: 20,
                width: 2,
                color: AppColors.ASH,
              ),
              TextButton(
                  onPressed: () {
                    AppNavigationHelper.navigateToWidget(
                        context, const BaseHomePage());
                  },
                  child: const Text(
                    "Continue as guest",
                    style: TextStyle(color: AppColors.PRIMARYCOLOR),
                  ))
            ],
          ),
          AppSpaces.height20
        ]),
      ),
    );
  }
}
