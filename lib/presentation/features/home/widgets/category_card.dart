import 'package:flutter/material.dart';
import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/core/text_styles.dart';

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  CategoryCard({super.key, required this.categories, required this.index, required this.isSelected});

  final List categories;
  final int index;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      //
      decoration: BoxDecoration(color: isSelected ? AppColors.colorWhiteLight : AppColors.colorGreyMed, borderRadius: BorderRadius.circular(26)),
      child: Text(categories[index], style: Styles.style12mainClrM),
    );
  }
}