import 'package:flutter/material.dart';
import 'package:foodapp/Reviews/review_list_widget.dart';

import 'app_bar_reviews.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarReviews(context),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 29),
          child: Column(
            children: [
              TextField(
                readOnly: true, // Makes the TextField read-only to prevent keyboard pop-up
                onTap: () {
                  Navigator.pushNamed(context, "/reviewRestaurent");
                },
                decoration: InputDecoration(
                  hintText: 'Write your review...',
                  hintStyle: const TextStyle(
                      fontFamily: "sofia_Medium_pro", // Use your custom font
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF111719),
                      fontSize: 14 // Consistent text color
                      ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFFE724C)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFFE724C)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/profilePhoto.png', // Replace with your image path
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35,),
              Expanded(child: reviewListWidget())
            ],
          ),
        ));
  }
}
