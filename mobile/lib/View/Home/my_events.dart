import 'package:flutter/material.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Provider/Events/event_provider.dart';
import 'package:hackaton/Services/Local/shared_prefs_manager.dart';
import 'package:hackaton/Utils/utils.dart';
import 'package:hackaton/Widgets/event_widget.dart';
import 'package:hackaton/Widgets/my_event_details_bottom_sheet.dart';
import 'package:provider/provider.dart';

class MyEventsPage extends StatefulWidget {
  const MyEventsPage({super.key});

  @override
  State<MyEventsPage> createState() => _MyEventsPageState();
}

class _MyEventsPageState extends State<MyEventsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<EventProvider>().getAllMyEvent();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Friends of Bulgaria",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: AppColors.GRAY,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Consumer<EventProvider>(builder: (context, event, _) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpaces.height20,
                Text(
                  "My Events",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                AppSpaces.height16,
                ...List.generate(event.paymentRequest.length, (index) {
                 var dataList =  event.paymentRequest.reversed.toList();
                  return EventWidget(
                    imageUrl: dataList[index].displayImg ?? "",
                    month: "NOV",
                    time: "03:00 PM - 09:00 PM",
                    title: dataList[index].title ?? "",
                    date: DateTime.parse(dataList[index].eventDate!)
                        .day
                        .toString(),
                    location: dataList[index].location ?? "",
                    height: 140,
                    showPrice: false,
                    color: Color(0xffEA580C),
                    onTap: () {
                      event.setMyRequest(dataList[index]);
                      showBottomSheet(
                          context: context,
                          builder: (context) {
                            return FractionallySizedBox(
                                heightFactor: 0.9,
                                child: MyEventDetailsBottomSheet());
                          });
                    },
                  );
                })
              ],
            ),
          );
        }),
      ),
    );
  }
}
