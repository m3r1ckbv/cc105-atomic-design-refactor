import 'package:flutter/material.dart';
import '../atoms/app_icon.dart';

class SearchInput extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const SearchInput({
    super.key, 
    required this.onChanged
    }
  );

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final _controller = TextEditingController();
  bool _hasText = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (value) => setState(() => _hasText = value.isNotEmpty),
      decoration: InputDecoration(
        hintText: 'Type a product name...',
        prefixIcon: const AppIcon(Icons.search, size: 20, color: null),
        suffixIcon: _hasText
            ? IconButton(
                icon: const AppIcon(Icons.clear, size: 18, color: null),
                onPressed: () {
                  _controller.clear();
                  setState(() => _hasText = false);
                },
              )
            : null,
        filled: true,
      ),
    );
  }
}
