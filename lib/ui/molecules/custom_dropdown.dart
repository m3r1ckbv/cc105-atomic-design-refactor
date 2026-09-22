import 'package:flutter/material.dart';
import '../atoms/app_text.dart';

class CustomDropdown extends StatelessWidget {
  
  final String label;
  final String defaultValue;
  final List<String> category;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.defaultValue,
    required this.category,
    required this.onChanged
  });
  
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        initialValue: defaultValue,
        decoration: InputDecoration(labelText: label),
        items: category.map((cat) => DropdownMenuItem(value: cat, child: AppText(cat, style: AppTextStyle.normal))).toList(),
        onChanged: onChanged,
    );

  }
}