import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Core/Helpers/navigation_helper.dart';
import 'package:hackaton/Provider/Events/event_provider.dart';
import 'package:hackaton/Provider/Payment/payment.dart';
import 'package:hackaton/Services/Local/localDB_config.dart';
import 'package:hackaton/Services/Local/shared_prefs_manager.dart';
import 'package:hackaton/View/Home/base_home.dart';
import 'package:hackaton/View/Onboarding/onboarding.dart';
import 'package:provider/provider.dart';

class SuccesPayment extends StatefulWidget {
  const SuccesPayment({super.key});

  @override
  State<SuccesPayment> createState() => _SuccesPaymentState();
}

class _SuccesPaymentState extends State<SuccesPayment> {
  final SharedPrefsManager sharedPrefsManager = SharedPrefsManager();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var ctx = context.read<EventProvider>();
      context.read<PaypalProvider>().captureOrder(context);
      var event = context.read<EventProvider>();
      ctx.saveEventForLoacal(
          name: event.payerName,
          price: event.totalAmount,
          quantity: event.quantity,
          ticketType: event.ticketType);
      // final eventId = await databaseHelper.insertEvent(ctx.selectedEvent);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              AppSpaces.height40,
              Center(
                  child: SizedBox(
                height: 250,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/images/Success.svg',
                      height: 200,
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: SvgPicture.asset(
                          'assets/images/semi_circle.svg',
                          width: 200,
                        ))
                  ],
                ),
              )),
              AppSpaces.height16,
              Text(
                "Purchase complete!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              AppSpaces.height16,
              Text(
                "See you at the event!",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6B7280)),
              ),
              AppSpaces.height20,
              AppSpaces.height20,
              AppSpaces.height20,
              CustomButton(
                name: 'View ticket',
                onTap: () {
                  AppNavigationHelper.setRootOldWidget(context, BaseHomePage());
                },
              ),
              AppSpaces.height20,
              TextButton(
                  onPressed: () {
                    AppNavigationHelper.setRootOldWidget(
                        context, BaseHomePage());
                  },
                  child: Text(
                    "Explore more events",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: AppColors.PRIMARYCOLOR),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
