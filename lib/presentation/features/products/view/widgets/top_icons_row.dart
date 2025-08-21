import 'package:e_commerce/core/app_assets.dart';
import 'package:e_commerce/presentation/features/products/view/widgets/circle_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopIconsRow extends StatelessWidget {
  const TopIconsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(onTap: () {}, child: SvgPicture.asset(AppAssets.arrowBackIcon, height: 16)),
          const Row(
            children: [
              CircleIcon(iconurl: AppAssets.heartOff),
              //
              SizedBox(width: 10),
              //
              CircleIcon(iconurl: AppAssets.bag),
            ],
          ),
        ],
      ),
    );
  }
}