import 'package:flutter/material.dart';
import '../atoms/app_text.dart';
import '../atoms/app_icon.dart';
import '../atoms/custom_button.dart';
import '../molecules/product_price.dart';
import '../../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;
  final VoidCallback onDelete;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAddToCart,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF9D9D9D),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: AppIcon(product.icon, color: Colors.indigo),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(product.name, style: AppTextStyle.normal),
                AppText(product.category, style: AppTextStyle.category),
                ProductPrice(price: product.price),
              ],
            ),
          ),
          Column(
            children: [
              AppButton(
                label: 'Add to Cart',
                onPressed: onAddToCart,
                bgcolor: Colors.indigo,
                textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,),
              ),
              const SizedBox(height: 6),
              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
