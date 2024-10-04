import 'package:flutter/material.dart';

class Review {
  final String reviewerName;
  final double rating; // Assume rating is out of 5.0
  final String comment;
  final String date;
  final String imageUrl; // Added property for the reviewer's image

  Review({
    this.reviewerName = "anonymous",
    required this.rating,
    required this.comment,
    required this.date,
    this.imageUrl = "assets/profile.png", // Include imageUrl in the constructor
  });
}

List<Review> reviewsList = [
  Review(
    reviewerName: 'Alyce Lambo',
    rating: 5.0,
    comment: 'Really convenient and the points system helps benefit loyalty. Some mild glitches here and there, but nothing too egregious. I’ve been using the service for a few months now, and overall, it has greatly improved my experience. Their support team is also very responsive when issues do occur, which is always appreciated.',
    date: "25/06/2020",
    imageUrl: 'assets/alyce.png', // Replace with your image asset path
  ),
  Review(
    reviewerName: 'Gonela Solom',
    rating: 4.5,
    comment: 'Been a life saver during the pandemic, although they could improve some UI elements and how they handle specials. Sometimes, promotions feel misleading because by the time you try to use them, they’re already expired or out of stock. However, the service itself has been incredibly helpful, and I’d recommend it to friends.',
    date: "22/06/2020",
    imageUrl: 'assets/gonela.png', // Replace with your image asset path
  ),
  Review(
    reviewerName: 'Brian C',
    rating: 2.5,
    comment: 'Got an intro offer of 50% off first order that did not work. I tried contacting support but couldn’t find a proper way to get in touch, which was frustrating. The app layout is a bit confusing at times, and there’s definitely room for improvement. If they fix these issues, I’d consider using the service more often, but for now, it’s a bit of a hassle.',
    date: "22/06/2020",
    imageUrl: 'assets/brian.png', // Replace with your image asset path
  ),
  Review(
    reviewerName: 'Helsmar E',
    rating: 3.5,
    comment: 'Satisfactory experience. The service is decent, but I feel like the quality has dropped a bit recently. The speed of delivery has slowed, and sometimes the app glitches, making it hard to place orders. Despite that, I’ve had some positive experiences with the support team resolving issues in a timely manner, so I’ll keep using it for now.',
    date: "25/06/2020",
    imageUrl: 'assets/helsmar.png', // Replace with your image asset path
  ),
  Review(
    reviewerName: 'Kavya Nair',
    rating: 4.0,
    comment: 'Great service overall, but the pricing could be more competitive. I use the app quite frequently, and I appreciate the convenience it brings to my busy lifestyle. The app could definitely use a few more updates to improve performance, but I can’t complain too much. The delivery tracking is also very accurate, which is a plus.',
    date: "10/06/2020",
    imageUrl: 'assets/kavya.png', // Replace with your image asset path
  ),
  Review(
    reviewerName: 'Siddharth Patel',
    rating: 1.5,
    comment: 'Had high hopes, but I was disappointed. The delivery was late, and my order wasn’t even correct. Tried reaching out to customer service, but it took ages to get a response. I get that things are busy, but this experience wasn’t up to standard. Not sure if I’ll be using this service again unless things improve.',
    date: "15/06/2020",
    imageUrl: 'assets/siddharth.png', // Replace with your image asset path
  ),
  Review(
    reviewerName: 'Meera Iyer',
    rating: 4.8,
    comment: 'Absolutely love this service! The app is user-friendly, and the variety of options available keeps me coming back. I especially appreciate the loyalty rewards – it’s a great incentive to keep using the platform. If there’s one area to improve, I’d say it’s the delivery fees, but other than that, this has been a game changer for me.',
    date: "08/06/2020",
    imageUrl: 'assets/meera.png', // Replace with your image asset path
  ),
  Review(
    reviewerName: 'Vikram Singh',
    rating: 3.0,
    comment: 'The service is hit or miss. Some days, it works perfectly, and other times it’s just one issue after another. I’ve had deliveries arrive late, and once they forgot an item from my order. That being said, when it works, it’s convenient. I really hope they improve consistency because the potential is definitely there.',
    date: "05/06/2020",
    imageUrl: 'assets/vikram.png', // Replace with your image asset path
  ),
];


Widget reviewListWidget() {
  if (reviewsList.isEmpty) {
    return const Center(
      child: Text(
        "No reviews yet!",
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
    );
  } else {
    return ListView.builder(
      itemCount: reviewsList.length, // Use widget.itemList.length for dynamic item count
      itemBuilder: (context, index) {
        final review = reviewsList[index]; // Fix variable name to 'item'
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0,),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 3,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 54,
                          height: 48,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  review.imageUrl,
                                  width: 48,
                                  height: 48,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFC529),
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Center(
                                    child: Text(
                                      review.rating.toString(),
                                      style: const TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8,
                                        fontFamily: "sofia_Medium_pro",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              review.reviewerName,
                              style: const TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                fontFamily: "sofia_Medium_pro",
                              ),
                            ),
                            Text(
                              review.date.toString(),
                              style: const TextStyle(
                                color: Color(0xFFB3B3B3),
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                fontFamily: "sofia_Medium_pro",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Icon(Icons.more_vert, color: Color(0xFF7F7D92),),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  review.comment,
                  style: const TextStyle(
                    color: Color(0xFF7F7D92),
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    fontFamily: "sofia_Medium_pro",
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
