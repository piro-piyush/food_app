import 'package:flutter/material.dart';
import 'package:foodapp/Home_screen/popular_items_grid.dart';
import '../Favourite/fav_food_items.dart';
import '../Food_details/food_details.dart';

class CategoryListWidget extends StatefulWidget {
  final List<FoodItems> itemList; // Use List<FoodItems> for strong typing
  const CategoryListWidget({required this.itemList, super.key});

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  // Function to toggle the favorite status of an item
  void toggleFavourite(FoodItems item) {
    setState(() {
      item.isFavourite = !item.isFavourite;
      if (item.isFavourite) {
        favFoodItems.add(item);
      } else {
        favFoodItems.remove(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.itemList.isEmpty
        ? Center(
      child: Text(
        "No items available in this category!",
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey[600],
        ),
      ),
    )
        : ListView.builder(
      itemCount: widget.itemList.length, // Use widget.itemList.length for dynamic item count
      itemBuilder: (context, index) {
        final item = widget.itemList[index]; // Fix variable name to 'item'

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodDetails(
                  item,
                  onCartUpdate: () {}, // Placeholder for cart update functionality
                ),
              ),
            );
          },
          child: Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            child: Container(
              height: 322,
              width: 269, // Same width as restaurant card
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
                                item.img, // Display the item's image
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
                                  width: 86,
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
                                          item.price.toStringAsFixed(2), // Display item price
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
                                    toggleFavourite(item);
                                  },
                                  child: Container(
                                    width: 34,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color: item.isFavourite
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
                              item.name, // Display the item name
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: "sofia_Medium_pro",
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              item.description ?? '', // Display the item description
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
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.rating.toString(), // Display the rating
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
                            "(${item.noOfPeople}+) ",
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
      },
    );
  }
}
