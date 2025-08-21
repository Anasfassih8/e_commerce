import 'package:e_commerce/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({super.key, required this.iconurl});
  final String iconurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        //
        color: AppColors.colorWhiteLight.withOpacity(0.8),
      ),
      //
      child: SvgPicture.asset(iconurl, color: AppColors.mainColor, height: 24),
    );
  }
}