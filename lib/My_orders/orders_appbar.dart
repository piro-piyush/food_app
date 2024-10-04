import 'package:flutter/material.dart';

AppBar appBarOrders(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white, // Set AppBar background to white
    elevation: 0, // Remove shadow under the AppBar
    leading: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/homeScreen"); // Return to the previous screen
      },
      child: Container(
        height: 38,
        width: 38,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x4DD3D1D8),
              offset: Offset(5, 10),
              blurRadius: 20,
            ),
          ],
        ),
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
    ),
    title: const Text(
      "My Orders",
      style: TextStyle(
        color: Color(0xFF323643),
        fontFamily: "sofia_Medium_pro",
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
    centerTitle: true, // Center the title
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/profile");
          },
          child: Hero(
            tag: 'profile-pic', // Add Hero animation for profile picture
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/profilePhoto.png"),
              radius: 20, // Adjust the size of the profile picture
            ),
          ),
        ),
      ),
    ],
  );
}
