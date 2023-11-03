import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Utils/utils.dart';
class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

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
              // LottieBuilder.asset('assets/images/loader.json'),
              const CupertinoActivityIndicator(),
              AppSpaces.height8,
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Loading...',
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.PRIMARYCOLOR
                    ),
                    speed: const Duration(milliseconds: 70),
                  ),
                ],
                totalRepeatCount: 4,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              )
              // Text("", style: GoogleFonts.lato(),)
            ],
          ),
        )),
      ),
    );
  }
}
