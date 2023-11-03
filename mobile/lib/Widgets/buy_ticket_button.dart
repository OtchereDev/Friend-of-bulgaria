
import 'package:flutter/material.dart';

class BuyTicketButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double amount;
  const BuyTicketButton({
    super.key, required this.amount,  this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xffEA580C),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Buy ticket ",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  color: const Color(0xff9A3412),
                  borderRadius: BorderRadius.circular(6)),
              child: Text(
                "£ $amount",
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

