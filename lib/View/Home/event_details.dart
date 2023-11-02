import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Core/app_constants.dart';
import 'package:hackaton/Provider/Events/event_provider.dart';
// import 'package:hackaton/Provider/Profile/profile_provider.dart';
import 'package:hackaton/View/Onboarding/onboarding.dart';
import 'package:hackaton/Widgets/buy_ticket_button.dart';
import 'package:hackaton/Widgets/event_buttom_sheet.dart';
import 'package:provider/provider.dart';

class EventDetails extends StatelessWidget {
  EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // var eventProvider = context.read<EventProvider>();
    // var user = context.read<ProfileProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Details"),
        centerTitle: true,
        backgroundColor: AppColors.GRAY,
      ),
      body: Consumer<EventProvider>(builder: (context, event, _) {
        // String formattedTime =
        //     DateFormat.jm().format(event.selectedEvent.eventDate!);
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 230,
                child: Stack(
                  children: [
                    Image.asset('assets/images/back.png'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: ImageViewContainerRemote(
                                  image: event.selectedEvent.displayImg ??
                                      "https://images.pexels.com/photos/976866/pexels-photo-976866.jpeg"))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpaces.height16,
                    Text(
                      event.selectedEvent.title ?? "",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    AppSpaces.height16,
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.GRAY,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  FeatherIcons.mapPin,
                                  color: Colors.grey[600],
                                  size: 17,
                                ),
                                AppSpaces.width8,
                                Text(
                                  event.selectedEvent.location ??
                                      "Bulgarian Embassy",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Divider(color: Colors.grey[200]),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  FeatherIcons.clock,
                                  color: Colors.grey[600],
                                  size: 15,
                                ),
                                AppSpaces.width8,
                                Text(
                                  "03:00 PM - 09:00 PM",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppSpaces.height20,
                    const Text(
                      "DETAILS",
                      style: TextStyle(
                          fontWeight: FontWeight.w800, letterSpacing: 2),
                    ),
                    AppSpaces.height16,
                    Text(
                      event.selectedEvent.details ?? DETAILS,
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return EventBottomSheet();
              });
          // PaymentRequest _re = PaymentRequest();
          // _re.address = eventProvider.selectedEvent.location;
          // _re.email = user.currentUserProfile?.data?.user?.email ??"";
          // _re.eventId = eventProvider.selectedEvent.eventId;
          // _re.phone = user.currentUserProfile?.data?.user?.phone ??"";
          // context.read<PaypalProvider>().createPayment(context, _re);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          // height: 50,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const BuyTicketButton(amount: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("All payments are done via PayPal"),
                  Image.asset('assets/images/paypal.png')
                ],
              ),
              AppSpaces.height8,
            ],
          ),
        ),
      ),
    );
  }
}
List<String> type = ["Regular", "VIP"];
