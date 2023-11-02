
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Utils/utils.dart';
import 'package:lottie/lottie.dart';
class LoadingPayment extends StatelessWidget {
  const LoadingPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Utils.screenHeight(context),
        width: Utils.screenWidth(context),
        color: AppColors.WHITE,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset('assets/images/load_payment.json',width: Utils.screenWidth(context)/4,),
              AppSpaces.height8,
              Text("Payment is being processed. Please wait", style: GoogleFonts.poppins().copyWith(fontSize: 12),)
            ],
          ),
        )),
      ),
    );
  }
}
