import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final String? hinText;
  final void Function(String)? onChanged;
  const Search({
    Key? key,
    this.onChanged,
    this.hinText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: hinText ?? 'Search...',
        prefixIcon: Icon(Icons.search),
      ),
      onChanged: onChanged,
    );
  }
}
