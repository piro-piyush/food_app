import 'package:flutter/material.dart';

import '../Reviews/review_list_widget.dart';

class ReviewRestaurent extends StatefulWidget {
  const ReviewRestaurent({super.key});

  @override
  State<ReviewRestaurent> createState() => _ReviewRestaurentState();
}

class _ReviewRestaurentState extends State<ReviewRestaurent> {
  int selectedRating = 0;
  String reviewText = '';

  // Get the corresponding text for the selected rating
  String _getRatingText(int rating) {
    const ratingDescriptions = {
      1: "Bad",
      2: "Not Good",
      3: "Need Improvement",
      4: "Good",
      5: "Excellent",
    };
    return ratingDescriptions[rating] ?? "Bad";
  }

  // Submit the review and update the review list
  void _submitReview() {
    if (reviewText.isNotEmpty && selectedRating > 0) {
      setState(() {
        reviewsList.add(
          Review(
            rating: selectedRating.toDouble(),
            comment: reviewText,
            date: DateTime.now().toString(),
          ),
        );
        // Reset review text and selected rating after submission
        reviewText = '';
        selectedRating = 0;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Review submitted!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please provide a rating and review.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 27,right: 27, bottom: 33, top: 119),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildContent(),
                _buildSubmitButton("SUBMIT"),
              ],
            ),
          ),
          _buildBackButton(),
        ],
      ),
    );
  }

  // Content block including logo, rating and text field
  Widget _buildContent() {
    return Column(
      children: [
        _buildLogo(),
        const SizedBox(height: 65),
        _buildHeader(),
        const SizedBox(height: 15),
        _buildRatingValue(),
        const SizedBox(height: 15),
        _buildStarRating(),
        const SizedBox(height: 65),
        _buildTextField("Write review"),
      ],
    );
  }

  // Logo widget
  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFD3D1D8).withOpacity(0.45),
                offset: const Offset(14.02, 21.04),
                blurRadius: 28.05,
              ),
            ],
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          child: Center(
            child: Image.asset(
              "assets/pizzahutlogo.png",
              height: 56,
              width: 56,
            ),
          ),
        ),
      ],
    );
  }

  // Header text widget
  Widget _buildHeader() {
    return const Column(
      children: [
        Text(
          "How was your last",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "sofia_Medium_pro",
            fontWeight: FontWeight.w300,
            fontSize: 31,
          ),
        ),
        Text(
          "order from Pizza Hut ?",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "sofia_Medium_pro",
            fontWeight: FontWeight.w300,
            fontSize: 31,
          ),
        ),
      ],
    );
  }

  // Display the rating value as text
  Widget _buildRatingValue() {
    return Text(
      _getRatingText(selectedRating),
      style: const TextStyle(
        fontSize: 22,
        fontFamily: "sofia_Medium_pro",
        fontWeight: FontWeight.w400,
        color: Color(0xFFFE724C),
      ),
    );
  }

  // Star rating widget
  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < selectedRating ? Icons.star : Icons.star_border,
            color: const Color(0xFFFFC529),
            size: 30,
          ),
          onPressed: () {
            setState(() {
              selectedRating = index + 1;
            });
          },
        );
      }),
    );
  }

  // Review text field widget
  Widget _buildTextField(String hintText) {
    return TextField(
      onChanged: (value) {
        setState(() {
          reviewText = value;
        });
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: "sofia_Medium_pro",
          fontWeight: FontWeight.w400,
          color: const Color(0xFF000000).withOpacity(0.20),
          fontSize: 16,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFEEEEEE)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFE724C), width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      ),
    );
  }

  // Submit button widget
  Widget _buildSubmitButton(String label) {
    return GestureDetector(
      onTap: _submitReview,
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
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: "sofia_Medium_pro",
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  // Back button widget
  Widget _buildBackButton() {
    return Positioned(
      top: 37,
      left: 27,
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
