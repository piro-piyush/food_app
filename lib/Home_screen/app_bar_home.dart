import 'package:flutter/material.dart';

AppBar appBarHome(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    title: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/addNewAddress");
      },
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Deliver to ",
                style: TextStyle(
                  color: Color(0xFF8C9099),
                  fontFamily: "sofia_Medium_pro",
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Color(0xFF8C9099),
                size: 15,
              ),
            ],
          ),
          Text(
            "4102 Pretty View Lane",
            style: TextStyle(
              color: Color(0xFFFE724C),
              fontFamily: "sofia_Medium_pro",
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 27.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/profile");
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/profilePhoto.png",
              height: 38,
              width: 38,
            ),
          ),
        ),
      ),
    ],
  );
}

