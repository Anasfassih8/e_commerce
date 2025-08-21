import 'package:flutter/material.dart';
import 'package:e_commerce/core/app_colors.dart';

class HomeScreenContainerContent extends StatelessWidget {
  const HomeScreenContainerContent({
    //
    super.key,
    required this.mainColor,
    required this.title,
    required this.subtitle,
    this.child,
  });
  final Color mainColor;
  final String title;
  final String subtitle;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: mainColor.withOpacity(0.1),
        //
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          //
          BoxShadow(
            color: Colors.grey.shade400,
            //
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        //
        children: [
          //
          Text(
            title,

            ///
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
          ),

          ///
          Text(
            subtitle,
            //
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}