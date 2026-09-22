// PAGE: the only file holding the mock product "data" — wires it into the
// template and organisms below. No network, no Firebase; just a demo.
import 'package:flutter/material.dart';
import 'package:messy_catalog_activity/ui/molecules/app_snackbar.dart';
import '../../models/product.dart';
import '../organisms/custom_appbar.dart';
import '../organisms/new_product_form.dart';
import '../organisms/product_card.dart';
import '../templates/product_list_template.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  List<Product> productList = [
    Product(id: 1, name: 'Wireless Mouse', price: 599.0, category: 'Electronics', icon: Icons.mouse,),
    Product(id: 2, name: 'Mechanical Keyboard', price: 2499.0, category: 'Electronics', icon: Icons.keyboard),
    Product(id: 3, name: 'Ceramic Mug', price: 149.0, category: 'Home', icon: Icons.coffee),
    Product(id: 4, name: 'Notebook', price: 79.0, category: 'Office', icon: Icons.book),
    Product(id: 5, name: 'Desk Lamp', price: 899.0, category: 'Home', icon: Icons.lightbulb),
    Product(id: 6, name: 'Backpack', price: 1299.0, category: 'Accessories', icon: Icons.backpack),
    Product(id: 7, name: 'Water Bottle', price: 299.0, category: 'Accessories', icon: Icons.local_drink),
  ];

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredProducts = productList.where((product) {
      return product.name.toLowerCase().contains(_searchQuery.toLowerCase());
    });

    return ProductListTemplate(
  appBar: const CustomAppBar(title: "Messy Catalog", color: Colors.white,),
  searchBar: SearchBar(
    onChanged: (value) {
      setState(() {
        _searchQuery = value;
      });
    },
  ),
  newProductForm: ProductForm(
    onSubmit: (product) {
      setState(() {
        productList.add(product);
      });
    },
  ),
  productCard: filteredProducts.map(
  (product) => ProductCard(
    product: product,
    onAddToCart: () {
      AppSnackBar.snackBarAppear(context, "Added ${product.name} to cart");
    },
    onDelete: () {
      setState(() {
        _searchQuery = '';
        productList.removeWhere((prod) => prod.id == product.id);
      });
    },
  ),
).toList(),

);

  }
}
