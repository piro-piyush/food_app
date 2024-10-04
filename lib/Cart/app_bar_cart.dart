import 'package:flutter/material.dart';

/// Creates a custom AppBar for the Cart screen.
AppBar appBarCart(BuildContext context) {
  return AppBar(
    backgroundColor: const Color(0xFFFFFFFF), // White background
    leading: _buildLeadingIcon(context), // Leading icon for navigation
    title: const Text(
      "Cart",
      style: TextStyle(
        color: Color(0xFF323643), // Title color
        fontFamily: "sofia_Medium_pro",
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
    centerTitle: true, // Center the title
  );
}

/// Builds the leading back icon for the AppBar.
Widget _buildLeadingIcon(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, "/homeScreen"); // Navigate back to home screen
    },
    child: Container(
      height: 38,
      width: 38,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the icon
        borderRadius: BorderRadius.circular(8), // Rounded corners
        boxShadow: const [
          BoxShadow(
            color: Color(0x4DD3D1D8), // Shadow color
            offset: Offset(5, 10), // Shadow offset
            blurRadius: 20, // Shadow blur radius
          ),
        ],
      ),
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black, // Icon color
      ),
    ),
  );
}
