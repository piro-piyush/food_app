import 'package:flutter/material.dart';

/// A reusable text field widget with a label and hint text.
Column textField(String label, String hint) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Label for the text field
      Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: "sofia_Medium_pro",
          fontWeight: FontWeight.w400,
          color: Color(0xFF9796A1),
        ),
      ),
      const SizedBox(height: 12), // Space between label and text field
      TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: _buildInputBorder(),
          focusedBorder: _buildInputBorder(),
          enabledBorder: _buildEnabledBorder(),
          contentPadding: const EdgeInsets.fromLTRB(20, 25, 0, 23),
          hintStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: Color(0xFFC4C4C4),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

/// Builds the default border for the text field.
OutlineInputBorder _buildInputBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xFFFE724C)),
    borderRadius: BorderRadius.circular(10),
  );
}

/// Builds the enabled border for the text field.
OutlineInputBorder _buildEnabledBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
    borderRadius: BorderRadius.circular(10),
  );
}
