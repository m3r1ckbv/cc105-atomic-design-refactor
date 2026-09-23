import 'package:flutter/material.dart';
import '../atoms/custom_button.dart';
import '../molecules/text_field.dart';
import '../molecules/custom_dropdown.dart';
import '../../models/product.dart';
import '../molecules/app_snackbar.dart';

class ProductForm extends StatefulWidget {
  final ValueChanged<Product> onSubmit;

  const ProductForm({
    super.key,
    required this.onSubmit,
  });

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();

  String _selectedCategory = 'Electronics';
  int _nextId = 8;

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Product? _buildProduct() {
    if (_formKey.currentState!.validate()) {
      return Product(
        id: _nextId,
        name: _nameController.text.trim(),
        price: double.parse(_priceController.text),
        category: _selectedCategory,
        icon: Icons.inventory_2,
      );
    }
    return null;
  }

  void _handleSubmit() {
    final product = _buildProduct();
    if (product != null) {
      widget.onSubmit(product);
      _nextId++;
      _nameController.clear();
      _priceController.clear();
      _descriptionController.clear();
      setState(() {
        _selectedCategory = 'Electronics';
      });
    } else {
      AppSnackBar.snackBarAppear(
        context,
        'Please check the form and try again.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: _nameController,
            hintText: "Product Name",
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Product name is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          CustomTextField(
            controller: _priceController,
            inputType: TextInputType.number,
            hintText: "Price",
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Price is required';
              }
              final parsed = double.tryParse(value);
              if (parsed == null) {
                return 'Price must be a number';
              }
              if (parsed <= 0) {
                return 'Price must be greater than zero';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          CustomDropdown(
            label: "Category",
            category: ['Electronics', 'Home', 'Office', 'Accessories'],
            defaultValue: _selectedCategory,
            onChanged: (value) {
              setState(() {
                _selectedCategory = value ?? 'Electronics';
              });
            },
          ),
          CustomTextField(
            controller: _descriptionController,
            hintText: 'Description',
            maxLines: 3,
          ),
          SizedBox(
            width: double.infinity,
            child: AppButton(
              label: 'Submit Product',
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              bgcolor: Colors.indigo,
              fgcolor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              onPressed: _handleSubmit
            ),
          )
        ],
      ),
    );
  }
}
