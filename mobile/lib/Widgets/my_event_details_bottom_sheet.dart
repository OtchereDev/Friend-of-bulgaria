import 'package:flutter/material.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Core/app_constants.dart';
import 'package:hackaton/Provider/Events/event_provider.dart';
import 'package:hackaton/Utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class MyEventDetailsBottomSheet extends StatelessWidget {
  const MyEventDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.screenHeight(context)-100,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: AppColors.WHITE),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Consumer<EventProvider>(
          builder: (context, event, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppSpaces.height16,
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: const Color(0xffE5E7EB)),
                      child: const Icon(Icons.close),
                    ),
                  ),
                ),
                AppSpaces.height16,
                Expanded(
                 child: SingleChildScrollView(
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Center(
                        child: CircleAvatar(
                      radius: 50,
                      child: Icon(
                        Icons.qr_code_2,
                        size: 50,
                      ),
                      backgroundColor: Color(0xffF3F4F6),
                    )),
                    AppSpaces.height16,
                    Text(
                      'Name',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    Text(event.mySelectedEvent.payerName??"",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700)),
                    AppSpaces.height20,
                    HeadingWidget(
                        title: 'Event', desc: event.mySelectedEvent.title ??""),
                    AppSpaces.height20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: HeadingWidget(title: 'Ticket type', desc: event.mySelectedEvent.ticketType ??""),
                        ),
                        Expanded(
                          child: HeadingWidget(title: 'Quantity', desc: event.mySelectedEvent.eventQuantity.toString()),
                        ),
                        Expanded(
                          child: HeadingWidget(title: 'Amount', desc: '£${event.mySelectedEvent.totalAmount}'),
                        ),
                      ],
                    ),
                    AppSpaces.height8,
                    Divider(
                      thickness: 0.5,
                      color: Colors.black12,
                    ),
                    AppSpaces.height8,
                    HeadingWidget(title: 'Date', desc: '03:00 PM - 09:00 PM'),
                    AppSpaces.height20,
                    HeadingWidget(title: 'Venue', desc: event.mySelectedEvent.location ??""),
                    AppSpaces.height8,
                    Divider(
                      thickness: 0.5,
                      color: Colors.black12,
                    ),
                    AppSpaces.height8,
                    Text(
                      'Details',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    ReadMoreText(
                      event.mySelectedEvent.details ??"",
                      trimLines: 2,
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    AppSpaces.height20,
                    ],
                   ),
                 ),
               )
              ],
            );
          }
        ),
      ),
    );
  }
}

class HeadingWidget extends StatelessWidget {
  final String title, desc;
  const HeadingWidget({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Color(0xff6B7280)),
        ),
        Text(desc,
            style: const TextStyle(
                fontSize: 14,
                color: Color(0xff374151),
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}
