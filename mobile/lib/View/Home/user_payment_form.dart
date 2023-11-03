import 'package:flutter/material.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Component/phoneNumberText.dart';
import 'package:hackaton/Component/roundedInputText.dart';
import 'package:hackaton/Model/Request/payment_request.dart';
import 'package:hackaton/Provider/Events/event_provider.dart';
import 'package:hackaton/Provider/Payment/payment.dart';
import 'package:hackaton/View/Onboarding/onboarding.dart';
import 'package:hackaton/Widgets/event_buttom_sheet.dart';
import 'package:provider/provider.dart';

class UserPaymentFormPage extends StatelessWidget {
  UserPaymentFormPage({super.key});
  final fullNamecontroller = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();
  final _scaffoldKey = GlobalKey<FormState>();
  final pageController = PageController();
  final selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    var event = context.read<EventProvider>();
    return Consumer<PaypalProvider>(builder: (context, authProvider, _) {
      return ValueListenableBuilder(
          valueListenable: selectedIndex,
          builder: (context, selceted, _) {
            return Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: AppColors.WHITE),
              child: Form(
                key: _scaffoldKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Buy Ticket",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Color(0xffE5E7EB)),
                                  child: const Icon(Icons.close),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppSpaces.height16,
                      Expanded(
                          child: PageView(
                        controller: pageController,
                        physics: NeverScrollableScrollPhysics(),
                        onPageChanged: (v) {
                          selectedIndex.value = v;
                        },
                        children: [
                          _PaymentForm(
                              fullNamecontroller: fullNamecontroller,
                              emailController: emailController,
                              phoneController: phoneController,
                              locationController: locationController),
                          EventBottomSheet(),
                        ],
                      )),
                      if (selceted == 0)
                        CustomButton(
                          name: 'Next',
                          onTap: () {
                            print(selceted);
                            if (selceted == 0) {
                              if (_scaffoldKey.currentState?.validate() ==
                                  true) {
                                PaymentRequest _paymentRequest =
                                    PaymentRequest();
                                _paymentRequest.address =
                                    locationController.text;
                                _paymentRequest.email = emailController.text;
                                _paymentRequest.phone = phoneController.text;
                                _paymentRequest.name = fullNamecontroller.text;

                                authProvider.setPaymentRequest(_paymentRequest);
                                //=============================================
                                event.setPayerName(fullNamecontroller.text);

                                // AppNavigationHelper.navigateToWidget(
                                //     context, RegisterPage());
                                pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              }
                            } else {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return EventBottomSheet();
                                  });
                            }
                          },
                        )
                      else
                        SizedBox(
                          width: double.infinity,
                          child: CustomOutlineButton(
                            name: 'Back',
                            onTap: () {
                              pageController.previousPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                          ),
                        ),
                      AppSpaces.height20,
                      AppSpaces.height20,
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}

class _PaymentForm extends StatelessWidget {
  final TextEditingController fullNamecontroller,
      emailController,
      phoneController,
      locationController;
  const _PaymentForm(
      {super.key,
      required this.fullNamecontroller,
      required this.emailController,
      required this.phoneController,
      required this.locationController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: AppColors.WHITE,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpaces.height8,
            Text(
              "Provide information to be use for prepaing reciept",
              style: TextStyle(fontSize: 12),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black12,
            ),
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
              validate: false,
            ),
            AppSpaces.height20,
            RoundedInputField(
              keyboardType: TextInputType.text,
              hintText: 'Enter Location',
              labelText: 'Location',
              textEditingController: locationController,
              validate: true,
              validateMsg: 'Location is required',
            ),
            AppSpaces.height20,
          ],
        ),
      ),
    );
  }
}
