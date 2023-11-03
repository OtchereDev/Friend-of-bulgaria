

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Provider/Events/event_provider.dart';
import 'package:hackaton/Utils/utils.dart';
import 'package:provider/provider.dart';

class CurrentEvenWidget extends StatefulWidget {
  final VoidCallback? onTap;
  const CurrentEvenWidget({
    super.key, this.onTap,
  });

  @override
  State<CurrentEvenWidget> createState() => _CurrentEvenWidgetState();
}

class _CurrentEvenWidgetState extends State<CurrentEvenWidget> {
   void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Consumer<EventProvider>(
        builder: (context, pro, _) {
          return Container(
            // width: double.infinity,
            width: Utils.screenWidth(context),
    
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: const Color(0xffE2E8F0)),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 170,
                  child: Stack(
                    children: [
                      Image.network(
                        pro.paymentRequest[0].displayImg ??"",
                        width: Utils.screenWidth(context) - 50,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: const Color(0xffEA580C),
                              borderRadius: BorderRadius.circular(12)),
                          child:  Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                               "0${DateTime.parse(pro.paymentRequest[0].eventDate!).day.toString()} Nov",
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
                 Text(
                  pro.paymentRequest[0].title ??"",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AppSpaces.height16,
                 Row(
                  children: [
                    Icon(FeatherIcons.mapPin,
                        size: 16, color: AppColors.ASHDEEP),
                    AppSpaces.width8,
                    Text(
                      pro.paymentRequest[0].location ??"",
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
          );
        }
      ),
    );
  }
}

