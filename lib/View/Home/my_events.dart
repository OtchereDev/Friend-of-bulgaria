import 'package:flutter/material.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Widgets/event_widget.dart';

class MyEventsPage extends StatelessWidget {
  const MyEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text(
          "Friends of Bulgaria",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: AppColors.GRAY,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal:20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             AppSpaces.height20,
              Text(
                "My Events",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              AppSpaces.height16,
                EventWidget(
                  month: "NOV",
                time: "03:00 PM - 09:00 PM",
                title: "Toddlers Talent Express Show Event",
                date: '07',
                location: "Bulgarian Embassy",
                height: 140,
                showPrice: false,
                color: Color(0xffEA580C),
              ),
          ],
        ),
      ),
    );
  }
}