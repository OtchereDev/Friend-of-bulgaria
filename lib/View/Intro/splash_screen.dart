
import 'package:flutter/material.dart';
import 'package:hackaton/AppTheme/app_config.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PRIMARYCOLOR,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/img.png', width: 300,),
                // AppSpaces.height8,
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
