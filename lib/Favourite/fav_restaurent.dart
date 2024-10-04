import 'package:flutter/material.dart';
import 'package:foodapp/Home_screen/restaurent_list.dart';
import '../Home_screen/buildtag.dart'; // Assuming this is a widget for displaying tags.

final List<Restaurant> favRestaurantsList = []; // Assuming this is already populated

class FavRestaurant extends StatefulWidget {
  const FavRestaurant({super.key});

  @override
  State<FavRestaurant> createState() => _FavRestaurantState();
}

class _FavRestaurantState extends State<FavRestaurant> {
  // Function to toggle the favorite status of a restaurant
  void toggleFavourite(Restaurant item) {
    setState(() {
      item.isFavourite = !item.isFavourite;
      if (!item.isFavourite) {
        favRestaurantsList.remove(item);
      }
    });
  }

  // Method to build individual restaurant cards
  Widget _buildRestaurantCard(Restaurant restaurant) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: Container(
        height: 343,
        padding: const EdgeInsets.only(top: 5, bottom: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFD3D1D8).withOpacity(0.25),
              offset: const Offset(15, 15),
              blurRadius: 30,
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                // Image of the restaurant
                SizedBox(
                  height: 233,
                  width: double.infinity, // Use full width
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
                // Rating and favorite button
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Rating
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
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF9796A1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Favorite button
                      GestureDetector(
                        onTap: () => toggleFavourite(restaurant),
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: restaurant.isFavourite
                                ? const Color(0xFFFE724C)
                                : const Color(0xFF9796A1),
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
            const SizedBox(height: 5),
            // Restaurant information
            SizedBox(
              width: double.infinity, // Use full width
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          restaurant.name,
                          style: const TextStyle(
                            color: Colors.black,
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
                    // Free delivery and time information
                    Row(
                      children: [
                        Image.asset("assets/bike.png"),
                        const SizedBox(width: 7),
                        const Text(
                          "Free delivery",
                          style: TextStyle(
                            color: Color(0xFF7E8392),
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
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Tags for restaurant
                    Row(
                      children: [
                        buildTag("BURGER"), // Assuming `buildTag` is a custom widget
                        const SizedBox(width: 12),
                        buildTag("CHICKEN"),
                        const SizedBox(width: 12),
                        buildTag("FAST FOOD"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return favRestaurantsList.isEmpty
        ? Center(
      child: const Text(
        'No favorite restaurants yet!',
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
    )
        : ListView.separated(
      itemCount: favRestaurantsList.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return _buildRestaurantCard(favRestaurantsList[index]);
      },
    );
  }
}
