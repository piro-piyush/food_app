import 'package:flutter/material.dart';

Container buildTag(String text) {
  return Container(
    width: 70,
    height: 22,
    decoration: BoxDecoration(
      color: const Color(0xFFF6F6F6),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF7E8392),
          fontFamily: "sofia_Medium_pro",
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    ),
  );
}