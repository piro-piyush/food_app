import 'package:flutter/material.dart';
import '../Reviews/review_list_widget.dart';

class Rating extends StatefulWidget {
  final String img;
  final String name;

  const Rating({Key? key, required this.img, required this.name}) : super(key: key);

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  int selectedRating = 0;
  String reviewText = '';

  // Get the corresponding text for the selected rating
  String ratingValue(int selectedRating) {
    switch (selectedRating) {
      case 1: return "Bad";
      case 2: return "Not Good";
      case 3: return "Need Improvement";
      case 4: return "Good";
      case 5: return "Excellent";
      default: return "Bad";
    }
  }

  // Submit the review and update the review list
  void submitReview() {
    if (reviewText.isNotEmpty && selectedRating > 0) {
      setState(() {
        reviewsList.add(Review(
          reviewerName: widget.name,
          rating: selectedRating.toDouble(),
          comment: reviewText,
          date: DateTime.now().toString(),
          imageUrl: widget.img,
        ));
        reviewText = ''; // Clear the review text after submission
        selectedRating = 0; // Reset the selected rating
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 39),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                _buildBackgroundImage(),
                _buildRatingContent(),
                _buildBackButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width - 52,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          "assets/ratingBgImage.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      top: 7,
      left: 10,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, "/homeScreen"),
        child: Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x4DD3D1D8),
                offset: Offset(5, 10),
                blurRadius: 20,
                spreadRadius: 0,
              ),
            ],
          ),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildRatingContent() {
    return Padding(
      padding: const EdgeInsets.only(top: 112.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildProfileImage(),
          const SizedBox(height: 10),
          _buildUserName(),
          const SizedBox(height: 8),
          _buildUserAddress(),
          const SizedBox(height: 15),
          _buildOrderStatus(),
          const SizedBox(height: 30),
          _buildRatingPrompt(),
          const SizedBox(height: 27),
          _buildRatingValue(),
          const SizedBox(height: 15),
          _buildStarRating(),
          const SizedBox(height: 15),
          _buildReviewTextField(),
          const SizedBox(height: 44),
          _buildSubmitButton(context, "SUBMIT"),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(64),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 89,
                  width: 89,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFFC529).withOpacity(0.2),
                        offset: const Offset(0, 15),
                        blurRadius: 20,
                      ),
                    ],
                    color: const Color(0xFFFFC529),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Center(
                    child: Image.asset(widget.img, width: 58, height: 58),
                  ),
                ),
              ),
              Positioned(
                right: 15,
                bottom: 15,
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check_circle,
                      color: Color(0xFF029094),
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUserName() {
    return Text(
      widget.name,
      style: const TextStyle(
        fontSize: 20,
        fontFamily: "sofia_Medium_pro",
        fontWeight: FontWeight.w600,
        color: Color(0xFF000000),
      ),
    );
  }

  Widget _buildUserAddress() {
    return const Text(
      "4102 Pretty View Lanenda",
      style: TextStyle(
        fontSize: 14,
        fontFamily: "sofia_Medium_pro",
        fontWeight: FontWeight.w300,
        color: Color(0xFF9796A1),
      ),
    );
  }

  Widget _buildOrderStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: const Color(0xFF4EE476),
          ),
        ),
        const SizedBox(width: 6),
        const Text(
          "Order Delivered",
          style: TextStyle(
            fontSize: 14,
            fontFamily: "sofia_Medium_pro",
            fontWeight: FontWeight.w300,
            color: Color(0xFF4EE476),
          ),
        ),
      ],
    );
  }

  Widget _buildRatingPrompt() {
    return const Text(
      "Please Rate Delivery Service",
      style: TextStyle(
        fontSize: 18,
        fontFamily: "sofia_Medium_pro",
        fontWeight: FontWeight.w600,
        color: Color(0xFF000000),
      ),
    );
  }

  Widget _buildRatingValue() {
    return Text(
      ratingValue(selectedRating),
      style: const TextStyle(
        fontSize: 22,
        fontFamily: "sofia_Medium_pro",
        fontWeight: FontWeight.w400,
        color: Color(0xFFFE724C),
      ),
    );
  }

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
              selectedRating = index + 1; // Update selected rating
            });
          },
        );
      }),
    );
  }

  Widget _buildReviewTextField() {
    return TextField(
      onChanged: (value) {
        reviewText = value; // Update the review text
      },
      decoration: InputDecoration(
        hintText: 'Write a review',
        hintStyle: TextStyle(
          color: const Color(0xFF000000).withOpacity(0.33),
          fontWeight: FontWeight.w400,
          fontSize: 16,
          fontFamily: 'sofia_Medium_pro',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFFE724C)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      maxLines: 5,
      style: const TextStyle(
        color: Color(0xFF323643),
        fontSize: 15,
        fontFamily: 'sofia_Medium_pro',
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context, String label) {
    return GestureDetector(
      onTap: submitReview,
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
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
