import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/text_styles.dart';
import 'package:e_commerce/data/product.dart';
import 'package:e_commerce/presentation/features/cart/view/widgets/quantity_counter_row.dart';
import 'package:e_commerce/presentation/features/cart/view/widgets/title_size_row.dart';

import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.item, required this.index});
  final Product item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              //
              child: CachedNetworkImage(
                imageUrl: item.image.toString(),
                height: 80,
                width: 80,
                fit: BoxFit.cover,

                //
                progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleSizeRow(item: item),

                  //
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),

                    //
                    child: Text("\$${item.price}", style: Styles.style14mainClrL),
                  ),
                  QuantityCounterRow(index: index, item: item),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}