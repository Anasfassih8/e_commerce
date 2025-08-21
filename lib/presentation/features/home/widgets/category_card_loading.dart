import 'package:flutter/material.dart';
import 'package:e_commerce/core/app_colors.dart';

class CategoryCardLoading extends StatelessWidget {
  const CategoryCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),

      //
      decoration: BoxDecoration(color: AppColors.colorGreydark, borderRadius: BorderRadius.circular(26)),
      child: SizedBox(width: 100, height: 80),
    );
  }
}