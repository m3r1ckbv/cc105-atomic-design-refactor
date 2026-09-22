// TEMPLATE: layout skeleton only. Takes an AppBar and a list of children as
// params and arranges them — it never knows what a "real" product is, and
// renders correctly even with an empty list.
import 'package:flutter/material.dart' hide SearchBar;
import 'package:messy_catalog_activity/ui/atoms/app_text.dart';

class ProductListTemplate extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final List<Widget> productCard;
  final Widget searchBar;
  final Widget newProductForm;

  const ProductListTemplate({
    super.key,
    required this.appBar,
    required this.productCard,
    required this.searchBar,
    required this.newProductForm,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchBar,
            const SizedBox(height: 16),
            AppText("Catalog", style: AppTextStyle.title),
            const SizedBox(height: 8),
            Column(
              children: productCard.isEmpty
                  ? [const SizedBox(height: 1)]
                  : productCard,
            ),
            const Divider(height: 32, thickness: 1),
            AppText("Add new Product", style: AppTextStyle.title),
            newProductForm,
          ],
        ),
      ),
    );
  }
}
