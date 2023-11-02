

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Utils/utils.dart';

class CurrentEvenWidget extends StatelessWidget {
  final VoidCallback? onTap;
  const CurrentEvenWidget({
    super.key, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: double.infinity,
        width: Utils.screenWidth(context) - 100,
    
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: const Color(0xffE2E8F0)),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 140,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/home.png',
                    width: Utils.screenWidth(context) - 150,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: const Color(0xffEA580C),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "09 NOV",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                FeatherIcons.clock,
                                color: Colors.white,
                                size: 15,
                              ),
                              AppSpaces.width8,
                              Text(
                                "03:00 PM - 09:00 PM",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            AppSpaces.height16,
            const Text(
              "Toddlers Talent Express Show Event",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpaces.height16,
            const Row(
              children: [
                Icon(FeatherIcons.mapPin,
                    size: 16, color: AppColors.ASHDEEP),
                AppSpaces.width8,
                Text(
                  'Bulgarian Embassy',
                  style: TextStyle(
                      fontSize: 12,
                      color: AppColors.ASHDEEP,
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
            AppSpaces.height16,
            const Row(
              children: [
                Icon(FeatherIcons.clock,
                    size: 16, color: AppColors.ASHDEEP),
                AppSpaces.width8,
                Text(
                  '03:00 PM - 09:00 PM',
                  style: TextStyle(
                      fontSize: 12,
                      color: AppColors.ASHDEEP,
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

