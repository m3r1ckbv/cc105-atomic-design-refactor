// ATOM: pure presentation, no logic, no state — just props in, UI out.
import 'package:flutter/material.dart';

enum AppTextStyle { title, body, caption, normal, category, price }

class AppText extends StatelessWidget {
  final String text;
  final AppTextStyle style;
  final Color? color;

  const AppText(
    this.text, {
      super.key, 
      this.style = AppTextStyle.body,
      this.color
      }
    );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final textStyle = switch (style) {
      AppTextStyle.title => TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color ?? Colors.black87),
      AppTextStyle.body => theme.bodyMedium,
      AppTextStyle.caption => theme.bodySmall,
      AppTextStyle.normal => TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      AppTextStyle.category => TextStyle(fontSize: 13, color: const Color(0xFFBBBBBB)),
      AppTextStyle.price => TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
    };
    return Text(text, style: textStyle);
  }
}


