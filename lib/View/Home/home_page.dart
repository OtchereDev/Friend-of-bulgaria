import 'package:flutter/material.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Core/Helpers/navigation_helper.dart';
import 'package:hackaton/Provider/Events/event_provider.dart';
import 'package:hackaton/View/Home/event_details.dart';
import 'package:hackaton/Widgets/current_event_widget.dart';
import 'package:hackaton/Widgets/event_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     context.read<EventProvider>().getAllEvents(context);
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text(
          "Friends of Bulgaria",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: AppColors.GRAY,
      ),
      body: Consumer<EventProvider>(builder: (context, eventProvider, _) {
        // var day = (eventProvider.eventModel[0].eventDate ?? DateTime.now());
        // print(day.day);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpaces.height20,
                const Text(
                  "My Events",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                AppSpaces.height16,
                CurrentEvenWidget(
                  onTap: () {
                    // AppNavigationHelper.navigateToWidget(
                    //     context, const EventDetails());
                  },
                ),
                AppSpaces.height20,
                const Text(
                  "All Events",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                AppSpaces.height16,
                // if (eventProvider.isLoading)
                //   const Text("Loading...")
                // else
                //   ...List.generate(eventProvider.eventModel.length, (index) {
                //     var mon = DateFormat.M()
                //         .format(eventProvider.eventModel[index].eventDate!);
                //     var month = (months[int.parse(mon) - 1]);
                //     String formattedTime = DateFormat.jm().format(eventProvider.eventModel[index].eventDate!);

                //     return EventWidget(
                //       month: month.toString().toUpperCase(),
                //       time: formattedTime,
                //       title: eventProvider.eventModel[index].title ?? "",
                //       date: '${eventProvider.eventModel[index].eventDate?.day}',
                //       location: eventProvider.eventModel[index].location ?? "",
                //       height: 150,
                //       price: eventProvider.eventModel[index].price,
                //       onTap: (){
                //          AppNavigationHelper.navigateToWidget(
                //         context, const EventDetails());
                //         eventProvider.setEvent(eventProvider.eventModel[index]);
                //       },
                //     );
                //   }),
                 EventWidget(
                  month: "Nov",
                  time: "03:00 PM - 09:00 PM",
                  title: "Toddlers Talent Express Show Event",
                  date: '07',
                  location: "Bulgarian Embassy",
                  price: 20,
                  onTap: (){
                     AppNavigationHelper.navigateToWidget(
                        context,  EventDetails());
                  },
                ),
                const EventWidget(
                  month: "Nov",
                  time: "03:00 PM - 09:00 PM",
                  title: "Toddlers Talent Express Show Event",
                  date: '07',
                  location: "Bulgarian Embassy",
                  price: 20,
                ),
                // Expanded(
                //   child: ListView.builder(
                //       physics: NeverScrollableScrollPhysics(),
                //       itemCount: 1,
                //       itemBuilder: (context, index) {
                //         return const EventWidget(
                //           month: "Nov",

                //           time: "03:00 PM - 09:00 PM",
                //           title: "Toddlers Talent Express Show Event",
                //           date: '07',
                //           location: "Bulgarian Embassy",
                //         );
                //       }),
                // ),

                AppSpaces.height16,
              ],
            ),
          ),
        );
      }),
    );
  }
}
