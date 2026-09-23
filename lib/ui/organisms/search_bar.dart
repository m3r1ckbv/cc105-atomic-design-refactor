import 'package:flutter/material.dart';
import '../atoms/app_icon.dart';
import '../atoms/app_text.dart';
import '../molecules/text_field.dart';

class SearchInput extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const SearchInput({
    super.key,
    required this.onChanged,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final _controller = TextEditingController();
  bool _hasText = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppText(
          "Search Products",
          style: AppTextStyle.title,
        ),
        const SizedBox(height: 8),
        CustomTextField(
          hintText: "Type a product name...",
          controller: _controller,
          onChanged: (value) {
            setState(() => _hasText = value.isNotEmpty);
          widget.onChanged(value);
          },
          decoration: InputDecoration(
            label: Text("Type a product name..."),
            suffixIcon: _hasText
              ? IconButton(
                  icon: const AppIcon(Icons.clear, size: 18, color: null),
                  onPressed: () {
                    _controller.clear();
                    setState(() => _hasText = false);
                  },
                )
              : null,
          ),
        ),
      ],
    );
  }
}
