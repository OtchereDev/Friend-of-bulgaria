import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardLoadingShimmer extends StatelessWidget {
  final int? numberOfCards;
  const CardLoadingShimmer({Key? key, this.numberOfCards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey[200]!,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(children: List.generate(numberOfCards??3, (index) => InactiveCard()),)),
    );
  }
}

class InactiveCard extends StatelessWidget {
  const InactiveCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 5),
        width: double.infinity,
        height: 110,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Card(
            semanticContainer: true,
            color: Colors.white,
            shadowColor: Colors.grey[50],
            elevation: 20,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            borderOnForeground: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: const SizedBox(height: 70)));
  }
}
