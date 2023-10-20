import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  const SearchTextField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Search",
        suffixIcon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        border: buildOutLineInputBorder(),
        enabledBorder: buildOutLineInputBorder(),
        focusedBorder: buildOutLineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutLineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.white));
  }
}
