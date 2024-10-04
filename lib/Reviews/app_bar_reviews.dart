import 'package:flutter/material.dart';

AppBar appBarReviews(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white, // Set AppBar background to white
    elevation: 0, // Remove shadow under the AppBar
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
      ),
      onPressed: () {
         Navigator.pop(context);
      },
    ),
    title: const Text(
      "Reviews",
      style: TextStyle(
        color: Color(0xFF323643),
        fontFamily: "sofia_Medium_pro",
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
    centerTitle: true, // Center the title
  );
}
