import 'dart:async';
import 'package:flutter/material.dart';

import '../Welcome_screen/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Timer for 3 seconds before navigating to HomeScreen
    Timer(const Duration(seconds:3), () {
      Navigator.pushReplacement(
        context,
        _createRoute(), // Custom route with swipe animation
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFFFE724C),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 93,
              height: 93,
              decoration: BoxDecoration(
                color: const Color(0xFFFEFEFE),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                    spreadRadius: 2, // How much the shadow spreads
                    blurRadius: 10,  // The blur effect of the shadow
                    offset: const Offset(0, 4), // The position of the shadow (horizontal, vertical)
                  ),
                ],
              ),
              child: Image.asset("assets/icon.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "FOOD ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: "Phosphate-Pro-Cond-Inline-Regular",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Opacity(
                  opacity: 0.6, // Set opacity here
                  child: Text(
                    "HUB",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: "Phosphate-Pro-Cond-Inline-Regular",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Create a custom route with a right-swipe transition
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
      const Welcome(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
