import 'package:flutter/material.dart';
import '../Food_details/food_details.dart';
import '../Home_screen/popular_items_grid.dart'; // Assuming this contains the FoodItems class definition

final List<FoodItems> favFoodItems = []; // List of favorite food items

class FavFoodItems extends StatefulWidget {
  const FavFoodItems({super.key});

  @override
  State<FavFoodItems> createState() => _FavFoodItemsState();
}

class _FavFoodItemsState extends State<FavFoodItems> {
  // Function to toggle the favorite status of a food item
  void toggleFavourite(FoodItems item) {
    setState(() {
      item.isFavourite = !item.isFavourite;
      // If item is no longer favorite, remove it from the list
      if (!item.isFavourite) {
        favFoodItems.remove(item);
      }
    });
  }

  // Method to build individual food item cards
  Widget _buildFoodItemCard(FoodItems foodItem) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetails(foodItem, onCartUpdate: () {}),
          ),
        );
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: Container(
          height: 322,
          width: 269, // Same height as restaurant card
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFFFFFF).withOpacity(0.25),
                offset: const Offset(15, 15),
                blurRadius: 30,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 233,
                        width: 362,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Image.asset(
                            foodItem.img,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.09),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 34,
                              width: 81,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(112),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFFE724C).withOpacity(0.2),
                                    offset: const Offset(0, 5.85),
                                    blurRadius: 23.39,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        "\$",
                                        style: TextStyle(
                                          fontSize: 13.8,
                                          fontFamily: "sofia_Medium_pro",
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFFE724C),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      foodItem.price.toStringAsFixed(2),
                                      style: const TextStyle(
                                        fontSize: 25.25,
                                        fontFamily: "sofia_Medium_pro",
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                toggleFavourite(foodItem);
                              },
                              child: Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: foodItem.isFavourite
                                      ? const Color(0xFFFE724C)
                                      : const Color(0xFF9796A1),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.09),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        Text(
                          foodItem.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "sofia_Medium_pro",
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          foodItem.description!,
                          style: const TextStyle(
                            color: Color(0xFF9796A1),
                            fontFamily: "sofia_Medium_pro",
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 81.09,
                left: 10.09,
                child: Container(
                  width: 72,
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF000000).withOpacity(0.21),
                        offset: const Offset(15, 15),
                        blurRadius: 30,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        foodItem.rating.toString(),
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
                        "(${foodItem.noOfPeople}+) ",
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return favFoodItems.isEmpty
        ? Center(
      child: const Text(
        "No favorite food items yet!",
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
    )
        : ListView.separated(
      itemCount: favFoodItems.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return _buildFoodItemCard(favFoodItems[index]);
      },
    );
  }
}
