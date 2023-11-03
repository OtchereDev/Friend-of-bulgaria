import 'package:flutter/material.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Core/app_constants.dart';
import 'package:hackaton/Provider/Events/event_provider.dart';
import 'package:hackaton/Provider/Payment/payment.dart';
import 'package:hackaton/View/Home/event_details.dart';
import 'package:hackaton/Widgets/buy_ticket_button.dart';
import 'package:hackaton/Widgets/ticket_type_button.dart';
import 'package:provider/provider.dart';

class EventBottomSheet extends StatelessWidget {
  final double? price;
  EventBottomSheet({
    super.key,
    this.price,
  });
  final selectedType = ValueNotifier(0);
  // final qty = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    var paypalPro = context.read<PaypalProvider>();
    return Consumer<EventProvider>(builder: (context, event, _) {
      return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: AppColors.WHITE,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpaces.height20,
            const Text("Ticket type"),
            AppSpaces.height8,
            ValueListenableBuilder(
                valueListenable: selectedType,
                builder: (context, ticket, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      event.selectedEvent.tickets!.length,
                      (index) => TicketTypeButton(
                        isActive: ticket == index,
                        title: type[index],
                        onTop: () {
                          selectedType.value = index;
                          event.setItemPrice(event.selectedEvent.tickets![index].price);

                          // event.setAmount(i) =
                          // event.selectedEvent.tickets![index].price;
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
                    event.decreaseQuantity(context);
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
                Text(
                  "${event.quantity}",
                  style: TextStyle(fontSize: 32),
                ),
                AppSpaces.width40,
                GestureDetector(
                  onTap: () {
                    event.increaseQuantity();
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
            BuyTicketButton(
              amount: (event.quantity * event.itemPrice),
              onTap: () {
                var evnt = event.selectedEvent;
                paypalPro.paymentRequest.ticketPrice =
                    event.quantity * event.itemPrice;
                paypalPro.paymentRequest.ticketQuantity = event.quantity;
                paypalPro.paymentRequest.ticketType =
                    selectedType.value == 0 ? "Regular" : "VIP";
                paypalPro.paymentRequest.eventName = evnt.title;
                event.setAmount((event.quantity * event.itemPrice).toString());
                event.setQantity(event.quantity);
                event
                    .setTicketTypr(selectedType.value == 0 ? "Regular" : "VIP");
                paypalPro.createPayment(context, paypalPro.paymentRequest);
              },
            ),
            AppSpaces.height16,
          ],
        ),
      );
    });
  }
}
