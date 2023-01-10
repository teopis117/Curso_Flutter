import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hinttext,
    required String labeltext,
    IconData? prefixicon,
  }) {
    return InputDecoration(
        prefixIcon: prefixicon != null
            ? Icon(
                prefixicon,
                color: Colors.deepPurple,
              )
            : null,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurple,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple, width: 2),
        ),
        hintText: hinttext,
        labelText: labeltext,
        labelStyle: TextStyle(color: Colors.grey));
  }
}
