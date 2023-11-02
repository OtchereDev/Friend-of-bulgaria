import 'package:flutter/material.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Component/passwordField.dart';
import 'package:hackaton/Component/phoneNumberText.dart';
import 'package:hackaton/Component/roundedInputText.dart';
import 'package:hackaton/Core/Helpers/navigation_helper.dart';
import 'package:hackaton/Provider/Auth/login_provider.dart';
import 'package:hackaton/Utils/Loaders/loader_utils.dart';
import 'package:hackaton/View/Auth/get_started.dart';
import 'package:hackaton/View/Home/base_home.dart';
import 'package:hackaton/View/Onboarding/onboarding.dart';
// import 'package:hackaton/Component/text_form_field.dart';
import 'package:hackaton/Widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authPro, _) {
      return authPro.loadPage
          ? LoadingPage()
          : Scaffold(
              appBar: AppBar(
                leading: SizedBox.shrink(),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: _scaffoldKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSpaces.height20,
                      Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w600),
                      ),
                      AppSpaces.height16,
                      Text(
                        "Stay abreast with upcoming events and purchase tickets super easily",
                        style: TextStyle(fontSize: 12),
                      ),
                      AppSpaces.height20,
                      RoundedInputField(
                        keyboardType: TextInputType.text,
                        hintText: 'Enter Email',
                        labelText: 'Email',
                        textEditingController: emailController,
                        validate: true,
                        validateEmail: true,
                        validateMsg: 'Email is required',
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
                      Spacer(),
                      CustomButton(
                        name: 'Log In',
                        onTap: () async {
                          if (_scaffoldKey.currentState?.validate() == true) {
                            await authPro
                                .performLogin(context,
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim())
                                .then((value) {
                              if (value == true) {
                                AppNavigationHelper.setRootOldWidget(
                                    context, BaseHomePage());
                              }
                            });
                          }
                        },
                      ),
                      AppSpaces.height8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                AppNavigationHelper.navigateToWidget(
                                    context, GetStarted());
                              },
                              child: const Text(
                                "Create a free account",
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
                      AppSpaces.height20,
                      AppSpaces.height20,
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
