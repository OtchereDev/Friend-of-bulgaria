
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hackaton/AppTheme/app_config.dart';

class EventWidget extends StatelessWidget {
  final String title, location, time, date, month, imageUrl;
  final double height;
  final double? price;
  final bool showPrice;
  final Color color;
  final VoidCallback? onTap;
  const EventWidget({
    super.key,
    required this.title,
    required this.location,
    required this.time,
    required this.date,
    this.showPrice = true,
    this.color = const Color(0xffF3F4F6),
    this.height = 170, this.price, required this.month, this.onTap, required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:12.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0xffF3F4F6)),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Container(
                width: 50,
                height: height,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                  border: Border.all(width: 1, color: const Color(0xffF3F4F6)),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        date,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: color == const Color(0xffF3F4F6)
                                ? Colors.grey[400]
                                : Colors.white),
                      ),
                      Text(
                        month,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: color == const Color(0xffF3F4F6)
                                ? Colors.grey[400]
                                : Colors.white),
                      ),
                    ]),
              ),
              AppSpaces.width8,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height == 170 ? AppSpaces.height20 : AppSpaces.height4,
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    AppSpaces.height8,
                    Row(
                      children: [
                        const Icon(FeatherIcons.mapPin,
                            size: 16, color: AppColors.ASHDEEP),
                        AppSpaces.width8,
                        Text(
                          location,
                          style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.ASHDEEP,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    AppSpaces.height8,
                    Row(
                      children: [
                        const Icon(FeatherIcons.clock,
                            size: 16, color: AppColors.ASHDEEP),
                        AppSpaces.width8,
                        Text(
                          time,
                          style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.ASHDEEP,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    AppSpaces.height8,
                    showPrice
                        ? Container(
                            width: 70,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xffFFEDD5)),
                            child:  Center(
                                child: Text(
                              "£ $price",
                              style: TextStyle(fontSize: 12),
                            )),
                          )
                        : const SizedBox.shrink(),
                    height == 170 ? AppSpaces.height20 : AppSpaces.height4,
                  ],
                ),
              ),
              AppSpaces.width8,
              Container(
                height: 80,
                width: 80,
                child: Image.network(imageUrl)//'assets/images/img.png'),
              ),
              AppSpaces.width8,
            ],
          ),
        ),
      ),
    );
  }
}
