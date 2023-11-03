import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hackaton/Utils/utils.dart';


class BlurImageContainer extends StatelessWidget {
  final String imageUrl;
  const BlurImageContainer({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
       height: Utils.screenHeight(context) / 3.3,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
          ),
        ),
      );
    
  }
}