
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackaton/AppTheme/app_config.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image.asset('assets/images/logo.jpeg', width: 300,),
                Text("Friends of Bulgaria", textAlign: TextAlign.center, style: GoogleFonts.aladin(fontSize: 35, fontWeight: FontWeight.bold),)
                // AppSpaces.height8,
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
