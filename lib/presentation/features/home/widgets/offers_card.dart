import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerce/core/app_assets.dart';
import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/core/app_strings.dart';
import 'package:e_commerce/core/text_styles.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColors.colorGreyLight),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Text(AppStrings.shopWithUs, style: Styles.style14mainClrM),
                Text(AppStrings.get40Off, style: Styles.style20mainClrL),
                Row(
                  children: [
                    Text(AppStrings.shopNow, style: Styles.style12mainClrL),

                    //
                    SvgPicture.asset(AppAssets.arrow),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Image.asset(AppAssets.manphoto, height: 100, width: 100),
        ],
      ),
    );
  }
}