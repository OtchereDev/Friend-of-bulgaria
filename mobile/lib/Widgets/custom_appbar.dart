import 'package:flutter/material.dart';
import 'package:hackaton/AppTheme/app_config.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        surfaceTintColor: Colors.transparent,
        title:  Text(
          title,
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: AppColors.GRAY,
      );
  }
}