import 'package:flutter/material.dart';

AppBar appBarFav(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white, // Set AppBar background to white
    elevation: 0, // Remove shadow under the AppBar
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.pushNamed(context, "/homeScreen"); // Go back to the previous screen
      },
    ),
    title: const Text(
      "Favourites",
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
            Navigator.pop(context);
          },
          child: const Hero(
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
