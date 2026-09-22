// ORGANISM: a recognizable component — logo + SearchBar molecule + profile
// icon — composed together, still with no data fetching of its own.
import 'package:flutter/material.dart' hide SearchBar;
import '../atoms/app_text.dart';

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
          Expanded(
              child: AppText(title, color:Colors.white, style: AppTextStyle.title,)
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
