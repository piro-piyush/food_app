import "package:flutter/material.dart";

import "../Rating/rating.dart";

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFD3D1D8).withOpacity(0.25),
                      // Shadow color (RGBA)
                      offset: const Offset(18.21, 18.21),
                      // Horizontal and vertical offset
                      blurRadius: 36.43,
                      // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFFD3D1D8)
                                          .withOpacity(0.45),
                                      // Shadow color (RGBA)
                                      offset: const Offset(18.21, 18.21),
                                      // Horizontal and vertical offset
                                      blurRadius: 36.43,
                                      // Blur radius
                                      spreadRadius: 0, // Spread radius
                                    ),
                                  ],
                                ),
                                child: Center(
                                    child: Image.asset(
                                  "assets/starbucks.png",
                                ))),
                            const SizedBox(width: 18),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "3 items",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "sofia_Medium_pro",
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF9796A1),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      "Starbucks",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "sofia_Medium_pro",
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF029094),
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        const Text(
                          "#264100",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "sofia_Medium_pro",
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFE724C),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Estimated arrival",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "sofia_Medium_pro",
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF9796A1),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "25 ",
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontFamily: "sofia_Medium_pro",
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF111719),
                                  ),
                                ),
                                Text(
                                  "min",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "sofia_Medium_pro",
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF111719),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Now",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "sofia_Medium_pro",
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF9796A1),
                              ),
                            ),
                            Text(
                              "Food on the way",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "sofia_Medium_pro",
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF111719),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 135,
                          height: 43,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFD3D1D8)
                                      .withOpacity(0.251),
                                  // Shadow color (RGBA)
                                  offset: const Offset(0, 20),
                                  // Horizontal and vertical offset
                                  blurRadius: 30,
                                  // Blur radius
                                  spreadRadius: 0, // Spread radius
                                ),
                              ],
                              borderRadius: BorderRadius.circular(100)),
                          child: const Center(
                              child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "sofia_Medium_pro",
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF111719),
                            ),
                          )),
                        ),
                        Container(
                          width: 135,
                          height: 43,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFE724C),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFFE724C)
                                      .withOpacity(0.251),
                                  // Shadow color (RGBA)
                                  offset: const Offset(0, 20),
                                  // Horizontal and vertical offset
                                  blurRadius: 30,
                                  // Blur radius
                                  spreadRadius: 0, // Spread radius
                                ),
                              ],
                              borderRadius: BorderRadius.circular(100)),
                          child: const Center(
                              child: Text(
                            "Track Order",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "sofia_Medium_pro",
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFFFFF),
                            ),
                          )),
                        )
                      ],
                    )
                  ],
                ),
              )),
          const SizedBox(height: 32),
          const Text(
            "Latest Orders",
            style: TextStyle(
              fontSize: 18,
              fontFamily: "sofia_Medium_pro",
              fontWeight: FontWeight.w600,
              color: Color(0xFF111719),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFD3D1D8).withOpacity(0.25),
                    // Shadow color (RGBA)
                    offset: const Offset(18.21, 18.21),
                    // Horizontal and vertical offset
                    blurRadius: 36.43,
                    // Blur radius
                    spreadRadius: 0, // Spread radius
                  ),
                ],
                borderRadius: BorderRadius.circular(18)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFD3D1D8)
                                        .withOpacity(0.45),
                                    // Shadow color (RGBA)
                                    offset: const Offset(18.21, 18.21),
                                    // Horizontal and vertical offset
                                    blurRadius: 36.43,
                                    // Blur radius
                                    spreadRadius: 0, // Spread radius
                                  ),
                                ],
                              ),
                              child: Center(
                                  child: Image.asset(
                                "assets/jimmy.png",
                              ))),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "20 jun, 10:30",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "sofia_Medium_pro",
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF9796A1),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 9,
                                  ),
                                  Container(
                                    width: 4,
                                    height: 4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: const Color(0xFFC4C4C4)),
                                  ),
                                  const SizedBox(
                                    width: 9,
                                  ),
                                  const Text(
                                    "3 items",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "sofia_Medium_pro",
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF9796A1),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    "Jimmy John's",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "sofia_Medium_pro",
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.check_circle,
                                    color: Color(0xFF029094),
                                    size: 12,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 7,
                                    height: 7,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: const Color(0xFF4EE476)),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    "Order Delivered",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "sofia_Medium_pro",
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF4EE476),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const Text(
                        "\$17.10",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "sofia_Medium_pro",
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFE724C),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Rating(
                                name: "Pizza Hut",
                                img: "assets/pizzahutlogo.png",
                              ), // Pass the product here
                            ),
                          );
                        },
                        child: Container(
                          width: 135,
                          height: 43,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFD3D1D8)
                                      .withOpacity(0.251),
                                  // Shadow color (RGBA)
                                  offset: const Offset(0, 20),
                                  // Horizontal and vertical offset
                                  blurRadius: 30,
                                  // Blur radius
                                  spreadRadius: 0, // Spread radius
                                ),
                              ],
                              borderRadius: BorderRadius.circular(100)),
                          child: const Center(
                              child: Text(
                            "Rate",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "sofia_Medium_pro",
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF111719),
                            ),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Rating(
                                name: "Pizza Hut0",
                                img: "assets/pizzahutlogo.png",
                              ), // Pass the product here
                            ),
                          );
                        },
                        child: Container(
                          width: 135,
                          height: 43,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFE724C),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFFE724C)
                                      .withOpacity(0.251),
                                  // Shadow color (RGBA)
                                  offset: const Offset(0, 20),
                                  // Horizontal and vertical offset
                                  blurRadius: 30,
                                  // Blur radius
                                  spreadRadius: 0, // Spread radius
                                ),
                              ],
                              borderRadius: BorderRadius.circular(100)),
                          child: const Center(
                              child: Text(
                            "Re-Order",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "sofia_Medium_pro",
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFFFFF),
                            ),
                          )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFD3D1D8).withOpacity(0.25),
                    // Shadow color (RGBA)
                    offset: const Offset(18.21, 18.21),
                    // Horizontal and vertical offset
                    blurRadius: 36.43,
                    // Blur radius
                    spreadRadius: 0, // Spread radius
                  ),
                ],
                borderRadius: BorderRadius.circular(18)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFD3D1D8)
                                        .withOpacity(0.45),
                                    // Shadow color (RGBA)
                                    offset: const Offset(18.21, 18.21),
                                    // Horizontal and vertical offset
                                    blurRadius: 36.43,
                                    // Blur radius
                                    spreadRadius: 0, // Spread radius
                                  ),
                                ],
                              ),
                              child: Center(
                                  child: Image.asset(
                                "assets/subwaylogo.png",
                              ))),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "19 jun, 11:50",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "sofia_Medium_pro",
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF9796A1),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 9,
                                  ),
                                  Container(
                                    width: 4,
                                    height: 4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: const Color(0xFFC4C4C4)),
                                  ),
                                  const SizedBox(
                                    width: 9,
                                  ),
                                  const Text(
                                    "3 items",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "sofia_Medium_pro",
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF9796A1),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    "Subway",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "sofia_Medium_pro",
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.check_circle,
                                    color: Color(0xFF029094),
                                    size: 12,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 7,
                                    height: 7,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: const Color(0xFF4EE476)),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    "Order Delivered",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "sofia_Medium_pro",
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF4EE476),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const Text(
                        "\$20.50",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "sofia_Medium_pro",
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFE724C),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 135,
                          height: 43,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFD3D1D8)
                                      .withOpacity(0.251),
                                  // Shadow color (RGBA)
                                  offset: const Offset(0, 20),
                                  // Horizontal and vertical offset
                                  blurRadius: 30,
                                  // Blur radius
                                  spreadRadius: 0, // Spread radius
                                ),
                              ],
                              borderRadius: BorderRadius.circular(100)),
                          child: const Center(
                              child: Text(
                            "Rate",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "sofia_Medium_pro",
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF111719),
                            ),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 135,
                          height: 43,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFE724C),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFFE724C)
                                      .withOpacity(0.251),
                                  // Shadow color (RGBA)
                                  offset: const Offset(0, 20),
                                  // Horizontal and vertical offset
                                  blurRadius: 30,
                                  // Blur radius
                                  spreadRadius: 0, // Spread radius
                                ),
                              ],
                              borderRadius: BorderRadius.circular(100)),
                          child: const Center(
                              child: Text(
                            "Re-Order",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "sofia_Medium_pro",
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFFFFF),
                            ),
                          )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
