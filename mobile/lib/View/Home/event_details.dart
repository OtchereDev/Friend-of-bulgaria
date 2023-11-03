import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Core/app_constants.dart';
import 'package:hackaton/Provider/Events/event_provider.dart';
import 'package:hackaton/Utils/utils.dart';
import 'package:hackaton/View/Home/user_payment_form.dart';
import 'package:hackaton/View/Onboarding/onboarding.dart';
import 'package:hackaton/Widgets/blur_image.dart';
import 'package:hackaton/Widgets/buy_ticket_button.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventDetails extends StatelessWidget {
  EventDetails({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // var eventProvider = context.read<EventProvider>();
    // var user = context.read<ProfileProvider>();
    return Scaffold(
      key: _scaffoldKey,
      body: LayoutBuilder(builder: (context, constraint) {
        return Consumer<EventProvider>(builder: (context, event, _) {
          String formattedTime = DateFormat.jm()
              .format(DateTime.parse(event.selectedEvent.eventDate!));
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Utils.screenHeight(context) / 2.7,
                      child: Stack(
                        children: [
                          BlurImageContainer(
                              imageUrl: event.selectedEvent.displayImg!),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20, top: 40),
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: ImageViewContainerRemote(
                                        image: event.selectedEvent.displayImg ??
                                            "https://images.pexels.com/photos/976866/pexels-photo-976866.jpeg"))),
                          ),
                          SafeArea(
                              child: BackButton(
                            color: AppColors.WHITE,
                          )),
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
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Divider(color: Colors.grey[200]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, bottom: 15),
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
                                        formattedTime,
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
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        // AppNavigationHelper.navigateToWidget(context, UserPaymentFormPage());
                        _scaffoldKey.currentState!
                            .showBottomSheet<Null>((BuildContext context) {
                          return FractionallySizedBox(
                              heightFactor: 0.7, child: UserPaymentFormPage());
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        // height: 50,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                             BuyTicketButton(amount: event.itemPrice),
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
                  ],
                ),
              ),
            ),
          );
        });
      }),
    );
  }
}

List<String> type = ["Regular", "VIP"];
