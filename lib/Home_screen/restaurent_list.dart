import 'package:flutter/material.dart';
import '../Favourite/fav_restaurent.dart'; // Ensure this path is correct
import 'buildtag.dart';

class Restaurant {
  String name;
  String img;
  double rating;
  int noOfPeople;
  bool isFavourite;

  Restaurant({
    required this.name,
    required this.img,
    required this.rating,
    required this.noOfPeople,
    this.isFavourite = false,
  });
}

List<Restaurant> restaurantList = [
  Restaurant(
    name: "McDonald's",
    img: "assets/macd.jpg",
    rating: 4.9,
    noOfPeople: 77,
  ),
  Restaurant(
    name: "KFC",
    img: "assets/smoky.png",
    rating: 4.2,
    noOfPeople: 91,
  ),
  Restaurant(
    name: "Pizza Hut",
    img: "assets/pizzahut.png",
    rating: 4.0,
    noOfPeople: 82,
  ),
  Restaurant(
    name: "Subway",
    img: "assets/subway.png",
    rating: 4.5,
    noOfPeople: 95,
  ),
  Restaurant(
    name: "Burger King",
    img: "assets/macd.jpg",
    rating: 4.1,
    noOfPeople: 91,
  ),
  Restaurant(
    name: "Taco Bell",
    img: "assets/tacobell.png",
    rating: 5.0,
    noOfPeople: 86,
  ),
  Restaurant(
    name: "Nando's",
    img: "assets/nando.png",
    rating: 4.8,
    noOfPeople: 83,
  ),
];

class GetRestaurant extends StatefulWidget {
  @override
  _GetRestaurantState createState() => _GetRestaurantState();
}

class _GetRestaurantState extends State<GetRestaurant> {
  void toggleFavourite(Restaurant item) {
    setState(() {
      item.isFavourite = !item.isFavourite;
      if (item.isFavourite) {
        favRestaurantsList.add(item); // Assuming favRestaurantsList is defined in fav_restaurent.dart
      } else {
        favRestaurantsList.remove(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return getRestaurant();
  }

  SizedBox getRestaurant() {
    return SizedBox(
      height: 237,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: restaurantList.length,
        itemBuilder: (context, index) {
          final restaurant = restaurantList[index];
          return Container(
            height: 237,
            width: 266,
            padding: const EdgeInsets.only(top: 5, bottom: 20),
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFD3D1D8).withOpacity(0.25),
                  offset: const Offset(15, 15),
                  blurRadius: 30,
                  spreadRadius: 0,
                ),
              ],
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 136,
                      width: 266,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.asset(
                          restaurant.img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 79,
                            height: 29,
                            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  restaurant.rating.toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: "sofia_Medium_pro",
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const Icon(
                                  Icons.star_outlined,
                                  color: Color(0xFFFFC529),
                                  size: 15,
                                ),
                                Text(
                                  "(${restaurant.noOfPeople}+) ",
                                  style: const TextStyle(
                                    fontFamily: "sofia_Medium_pro",
                                    fontSize: 9,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF9796A1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => toggleFavourite(restaurant),
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: restaurant.isFavourite ? const Color(0xFFFE724C) : const Color(0xFF9796A1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            restaurant.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "sofia_Medium_pro",
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.check_circle,
                            color: Color(0xFF029094),
                            size: 12,
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Image.asset("assets/bike.png"),
                          const SizedBox(width: 7),
                          const Text(
                            "Free delivery",
                            style: TextStyle(
                              color: Color(0xFF7E8392),
                              fontFamily: "sofia_Medium_pro",
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 17),
                          Image.asset("assets/time.png"),
                          const SizedBox(width: 5),
                          const Text(
                            "10-15 mins",
                            style: TextStyle(
                              color: Color(0xFF7E8392),
                              fontFamily: "sofia_Medium_pro",
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          buildTag("BURGER"),
                          const SizedBox(width: 12),
                          buildTag("CHICKEN"),
                          const SizedBox(width: 12),
                          buildTag("FAST FOOD"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
