import 'package:flutter/material.dart';
import 'package:e_commerce/core/animations/custom_fading_widget.dart';

import 'category_card_loading.dart';

class CategoryListLoading extends StatelessWidget {
  const CategoryListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: 80,
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(padding: EdgeInsets.only(right: 10), child: CategoryCardLoading());
          },
        ),
      ),
    );
  }
}