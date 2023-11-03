

import 'package:flutter/material.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Utils/utils.dart';

class TicketTypeButton extends StatelessWidget {
  final VoidCallback onTop;
  final String title;
  final bool isActive;
  const TicketTypeButton({
    super.key,
    required this.onTop,
    required this.isActive,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTop,
      child: Stack(
        children: [
          Container(
            height: 70,
            width: Utils.screenWidth(context) / 2.3,
            decoration: BoxDecoration(
                color: isActive ? Color(0xffFFEDD5) : Colors.transparent,
                border: Border.all(
                    color:
                        isActive ? AppColors.PRIMARYCOLOR : Color(0xffD1D5DB)),
                borderRadius: BorderRadius.circular(8)),
            child: Center(child: Text(title)),
          ),
          Positioned(
            right: 0,
            child: isActive
                ? Radio(
                    value: false,
                    groupValue: false,
                    onChanged: (onChanged) {},
                    activeColor: AppColors.PRIMARYCOLOR,
                  )
                : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: const Icon(
                      Icons.circle_outlined,
                      color: Color(0xffD1D5DB),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
