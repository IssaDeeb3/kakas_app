import 'package:flutter/material.dart';
import 'package:kakas_app/src/core/shared_widgets/shared_widgets.dart';

class SearchWidget extends StatelessWidget {
  final Function(String) onChanged;
  final Widget? suffixIcon;
  final TextEditingController? searchController;

  const SearchWidget({
    super.key,
    this.searchController,
    required this.onChanged,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      controller: searchController,
      onChanged: onChanged,
      hint: "Search...",
      suffixIcon: suffixIcon,
    );
  }
}
