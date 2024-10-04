import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/welcome_bg.png"), // Path to the image
              fit: BoxFit.cover, // Fit the image to cover the entire container
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x00494D63),
                      // rgba(73, 77, 99, 0) -> transparent color
                      Color(0xFF191B2F),
                      // #191B2F
                    ],
                    stops: [0.0017, 0.9029], // Match 0.17% and 90.29%
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 28, right: 31, top: 160, bottom: 49),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Welcome to ", // First part of the text
                                style: TextStyle(
                                  color: Colors.black,
                                  // Black color for "Welcome"
                                  fontSize: 53,
                                  fontFamily: "sofia_Medium_pro",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: "FoodHub", // Second part of the text
                                style: TextStyle(
                                  color: Color(0xFFFE724C),
                                  // Orange color for "FoodHub"
                                  fontSize: 45,
                                  fontFamily: "sofia_Medium_pro",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 80),
                          child: Text(
                            "Your favourite foods delivered fast at your door.",
                            style: TextStyle(
                              color: Color(0xFF30384F),
                              // Orange color for "FoodHub"
                              fontSize: 18,
                              fontFamily: "sofia_Medium_pro",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // Left line
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Colors.white.withOpacity(
                                      0.5), // Semi-transparent line
                                ),
                              ),
                              // "sign in" text in the center with transparent background
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                // Add some space around the text
                                color: Colors.transparent,
                                // Transparent background
                                child: Text(
                                  "sign in with",
                                  style: TextStyle(
                                    color: Colors.white,
                                    // Orange color for "FoodHub"
                                    fontSize: 16,
                                    fontFamily: "sofia_Medium_pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              // Right line
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Colors.white.withOpacity(
                                      0.5), // Semi-transparent line
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 140,
                                height: 54,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(28)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset("assets/fb.png"),
                                      Text(
                                        "FACEBOOK",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 140,
                                height: 54,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(28)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset("assets/google.png"),
                                      Text(
                                        "GOOGLE",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 23,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, "/signUp");
                            },
                            child: Container(
                              width: 315,
                              height: 54,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                // Rounded corners
                                color: Colors.white.withOpacity(0.21),
                                // Semi-transparent white background
                                border: Border.all(
                                  color: Colors.white, // White border color
                                  width: 1, // Border width
                                ),
                              ),
                              child: Center(
                                // Center the text inside the container
                                child: Text(
                                  "Start with email or phone",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: "sofia_Medium_pro",
                                    fontWeight: FontWeight.w500,
                                    color: Colors
                                        .white, // Text color (adjust if needed)
                                  ),
                                  textAlign: TextAlign
                                      .center, // Center text within the text widget
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 21,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white, // Text color
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/login");
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  // Remove default padding
                                  backgroundColor: Colors.transparent,
                                  // Remove default background
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration
                                        .underline, // Underline the text
                                  ),
                                ),
                                child: Text("Sign in",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration
                                          .underline, // Underline the text
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 56,
                right: 28,
                child: Container(
                  width: 55,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Colors.white
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/homeScreen");
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          color: Color(0xFFFE724C),
                          fontSize: 14,
                          fontFamily: "sofia_Medium_pro",
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                ),
              )
            ],
          )),
    );
  }
}
