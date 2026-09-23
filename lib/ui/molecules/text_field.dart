import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? inputType;
  final TextEditingController controller;
  final String? hintText;
  final int? maxLines;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final InputDecoration? decoration;

  const CustomTextField({
    super.key,
    this.inputType,
    required this.controller,
    this.hintText,
    this.maxLines,
    this.validator,
    this.onChanged,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: decoration ?? InputDecoration(
        hintText: hintText,
      ),
      maxLines: maxLines,
      keyboardType: inputType ?? TextInputType.text,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
