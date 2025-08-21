import 'package:flutter/material.dart';
import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/core/app_strings.dart';
import 'package:e_commerce/presentation/features/cart/view/widgets/build_summary_row.dart';
import 'package:e_commerce/presentation/features/cart/view/widgets/custom_dashed_line.dart';
import 'package:e_commerce/presentation/widgets/app_button.dart';

class CheckOutSection extends StatelessWidget {
  const CheckOutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: [
          BuildSummaryRow(title: AppStrings.subtotal, value: "\$${49}"),
          //
          BuildSummaryRow(title: AppStrings.shipping, value: "\$${5}"),
          //
          const CustomDashedLine(),
          //
          BuildSummaryRow(title: AppStrings.total, value: "\$${54}"), const SizedBox(height: 16),
          //
          AppButton(title: AppStrings.checkOut, onPressed: () {}, backgroundColor: AppColors.mainColor, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}