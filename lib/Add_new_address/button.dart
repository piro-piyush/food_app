import 'package:flutter/material.dart';

/// A custom orange button that navigates to a specified route or shows a SnackBar if no route is provided.
GestureDetector buttonOrange(BuildContext context, String label, {String? route}) {
  return GestureDetector(
    onTap: () {
      // Navigate to the specified route or show a SnackBar
      if (route != null) {
        Navigator.pushNamed(context, route);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No route specified!')),
        );
      }
    },
    child: Center(
      child: Container(
        width: 248,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFFFE724C),
          borderRadius: BorderRadius.circular(28.5),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFE724C).withOpacity(0.40),
              offset: const Offset(0, 20),
              blurRadius: 30,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            label, // Changed from 'word' to 'label' for clarity
            style: const TextStyle(
              color: Colors.white,
              fontFamily: "sofia_Medium_pro",
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      ),
    ),
  );
}
