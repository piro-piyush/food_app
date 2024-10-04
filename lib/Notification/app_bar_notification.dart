
import 'package:flutter/material.dart';

AppBar appBarNotification(BuildContext context){
  return AppBar(
    backgroundColor: const Color(0xFFFFFFFF),
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
      "Notifications",
      style: TextStyle(
        color: Color(0xFF323643),
        fontFamily: "sofia_Medium_pro",
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
    centerTitle: true,
  );
}