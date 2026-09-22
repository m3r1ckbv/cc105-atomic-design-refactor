import 'package:flutter/material.dart';
import '../atoms/app_text.dart';

class ProductPrice extends StatelessWidget {
  final double price;

  const ProductPrice({
    super.key,
    required this.price
  });

  @override
  Widget build(BuildContext context) {
    return AppText('PHP ${(price).toStringAsFixed(2)}', style: AppTextStyle.price);
  }
}