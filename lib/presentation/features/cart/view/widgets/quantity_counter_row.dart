import 'package:e_commerce/data/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerce/core/app_assets.dart';
import 'package:e_commerce/core/text_styles.dart';

class QuantityCounterRow extends StatelessWidget {
  const QuantityCounterRow({super.key, required this.index, required this.item});
  final int index;
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(onTap: () {}, child: SvgPicture.asset(AppAssets.plusIcon)),

            //
            Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('${item.quantity}', style: Styles.style12mainClrL)),

            //
            GestureDetector(onTap: () {}, child: SvgPicture.asset(AppAssets.minusingICon)),
          ],
        ),
        GestureDetector(onTap: () {}, child: SvgPicture.asset(AppAssets.delete)),
      ],
    );
  }
}