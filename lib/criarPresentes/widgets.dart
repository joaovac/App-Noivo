import 'package:flutter/material.dart';

TextField reusableTextField(String text, TextEditingController controller) {
  return TextField(
    controller: controller,
    enableSuggestions: true,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      labelText: text,
      labelStyle:
          TextStyle(color: Color.fromARGB(255, 250, 234, 234).withOpacity(0.8)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Color.fromARGB(255, 255, 242, 242).withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
  );
}
