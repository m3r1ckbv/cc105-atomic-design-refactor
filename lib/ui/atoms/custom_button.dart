import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final TextStyle textStyle;
  final Color? bgcolor;
  final Color? fgcolor;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  const AppButton({
    super.key,
    required this.label,
    required this.textStyle,
    this.bgcolor,
    this.fgcolor,
    this.padding,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgcolor,
        foregroundColor: fgcolor,
        padding: padding,
      ),
      onPressed: onPressed,
      child: Text(label, style: textStyle),
    );
  }
}
