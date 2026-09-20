// ORGANISM: a recognizable component — logo + SearchBar molecule + profile
// icon — composed together, still with no data fetching of its own.
import 'package:flutter/material.dart' hide SearchBar;
import 'package:messy_catalog_activity/ui/atoms/app_text.dart';
import '../atoms/app_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  final String title;
  final Color color;

  const CustomAppBar({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return AppBar( 
      backgroundColor: Colors.indigo,
      title: Row(
        children: [
          AppIcon(Icons.storefront, size: 28, color:Colors.white),
          const SizedBox(width: 12),
          Expanded(child: AppText(title)),
          const SizedBox(width: 12),
          AppIcon(Icons.account_circle, color:Colors.white),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
