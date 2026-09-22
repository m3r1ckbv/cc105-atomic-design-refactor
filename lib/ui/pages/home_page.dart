// PAGE: the only file holding the mock product "data" — wires it into the
// template and organisms below. No network, no Firebase; just a demo.
import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../templates/product_list_template.dart';
import '../organisms/custom_appbar.dart';

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
    // final filteredProducts = productList.where((prod) {
    //   return prod.name.toLowerCase().contains(_searchQuery.toLowerCase());
    // }).toList();

    return ProductListTemplate(
      appBar: const CustomAppBar(title : "Product Catalog", color: Colors.indigo,),
      children: [],
      searchBar: SearchBar(onChanged: (value){
        setState(() {
          _searchQuery = value;
        });
      }), 

      // addProductForm: AddProduct()
    );
  }
}
