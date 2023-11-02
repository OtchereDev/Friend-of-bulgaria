
import 'package:flutter/material.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/View/Home/event_details.dart';
import 'package:hackaton/Widgets/buy_ticket_button.dart';
import 'package:hackaton/Widgets/ticket_type_button.dart';

class EventBottomSheet extends StatelessWidget {
  EventBottomSheet({
    super.key,
  });
  final selectedType = ValueNotifier(0);
  final qty = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: AppColors.WHITE,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    color: Color(0xffE5E7EB)),
                child: const Icon(Icons.close),
              ),
            ),
          ),
          const Text(
            "Buy your ticket",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          AppSpaces.height20,
          const Text("Ticket type"),
          AppSpaces.height8,
          ValueListenableBuilder(
              valueListenable: selectedType,
              builder: (context, ticket, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    type.length,
                    (index) => TicketTypeButton(
                      isActive: ticket == index,
                      title: type[index],
                      onTop: () {
                        selectedType.value = index;
                      },
                    ),
                  ),
                );
              }),
          AppSpaces.height20,
          Spacer(),
          Center(child: Text("Quantity")),
          AppSpaces.height20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  qty.value--;
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color(0xffE5E7EB)),
                  child: const Icon(Icons.remove),
                ),
              ),
              AppSpaces.width40,
              ValueListenableBuilder(
                  valueListenable: qty,
                  builder: (context, quantity, _) {
                    return Text(
                      "$quantity",
                      style: TextStyle(fontSize: 32),
                    );
                  }),
              AppSpaces.width40,
              GestureDetector(
                onTap: () {
                  qty.value++;
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color(0xffE5E7EB)),
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          const Spacer(),
           ValueListenableBuilder(
             valueListenable: qty,
             builder: (context, qtyy, _) {
               return BuyTicketButton(amount:(qtyy*10) );
             }
           ),
          AppSpaces.height40,
        ],
      ),
    );
  }
}

