import 'package:flutter/material.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Component/passwordField.dart';
import 'package:hackaton/Component/phoneNumberText.dart';
import 'package:hackaton/Component/roundedInputText.dart';
import 'package:hackaton/Core/Helpers/navigation_helper.dart';
import 'package:hackaton/Model/Request/user_request.dart';
import 'package:hackaton/Provider/Auth/login_provider.dart';
import 'package:hackaton/Utils/Loaders/loader_utils.dart';
import 'package:hackaton/View/Onboarding/onboarding.dart';
// import 'package:hackaton/Component/text_form_field.dart';
import 'package:hackaton/Widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final fullNamecontroller = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        return authProvider.loadPage ? LoadingPage(): Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(double.infinity, 50),
              child: CustomAppBar(title: 'Register')),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                  PasswordField(
                    controller: passwordController,
                    hintText: 'Password',
                    inputType: TextInputType.text,
                    validateMsg: 'Password required',
                    validate: true,
                  ),
                  AppSpaces.height20,
                  AppSpaces.height20,
                  Spacer(),
                  CustomButton(
                    name: 'Submit',
                    onTap: () {
                      if (_scaffoldKey.currentState?.validate() == true) {
                        UserRequest _user = UserRequest();
                        _user.email = emailController.text;
                        _user.password = passwordController.text;
                        _user.phone = phoneController.text;
                        _user.name = fullNamecontroller.text;
                        authProvider.signUp(context, _user);
                        // AppNavigationHelper.navigateToWidget(
                        //     context, RegisterPage());
                      }
                    },
                  ),
                  AppSpaces.height20,
                  AppSpaces.height20,
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
