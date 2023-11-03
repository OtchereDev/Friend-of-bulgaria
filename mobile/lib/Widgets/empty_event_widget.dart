
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackaton/AppTheme/app_config.dart';

class EmptyEventWidget extends StatelessWidget {
  final bool showBorder;
  const EmptyEventWidget({
    super.key,  this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xffFFF7ED),
          border: Border.all(width: 1, color:showBorder?  const Color(0xffFED7AA): Colors.transparent),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          AppSpaces.height20,
          CircleAvatar(
            backgroundColor: Color(0xffFFEDD5),
            child: SvgPicture.asset('assets/icons/ticket.svg'),
          ),
          AppSpaces.height8,
          const Text(
            "You haven’t purchased any tickets...YET",
            style: TextStyle(
                color: AppColors.BLACK,
                fontWeight: FontWeight.w600,
                fontSize: 12),
          ),
          AppSpaces.height8,
          const Text(
            "All event tickets you’ve purchased will show here",
            style: TextStyle(color: Color(0xff6B7280), fontSize: 12),
          ),
          AppSpaces.height20
        ],
      ),
    );
  }
}

