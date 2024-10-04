import 'package:flutter/material.dart';

import '../Favourite/fav_food_items.dart';
import '../Food_details/food_details.dart';

class FoodItems {
  String name;
  double price;
  double? rating;
  int? noOfPeople;
  String img;
  String? description;
  bool isFavourite;
  bool isInCart;
  String? category;
  String? continent; // A string to represent the continent

  FoodItems({
    required this.name,
    required this.price,
    required this.rating,
    required this.noOfPeople,
    required this.img,
    required this.description,
    required this.category,
    required this.continent,
    this.isFavourite = false,
    this.isInCart = false,
  });
}

List<FoodItems> popularItemsList = [
  FoodItems(
    name: 'Salmon',
    rating: 4.5,
    price: 12.99,
    img: 'assets/salmon.png',
    noOfPeople: 32,
    description: 'A healthy and delicious salmon dish.',
    category: 'seafood',
    continent: 'American', // Assuming North America for Salmon
  ),
  FoodItems(
    name: 'Chhole Bhature',
    price: 3.99,
    rating: 4.2,
    img: 'assets/bhature.png',
    noOfPeople: 87,
    description: 'Fluffy and delicious bhature with chhole.',
    category: 'Chhole Bhature',
    continent: 'Indian', // Asia for Indian cuisine
  ),
  FoodItems(
    name: 'Nepali Momos',
    price: 5.49,
    rating: 4.8,
    img: 'assets/mom.png',
    noOfPeople: 96,
    description: 'Steamed or fried momos with spicy chutney.',
    category: 'Momos',
    continent: 'Indian', // Asia for Nepali cuisine
  ),
  FoodItems(
    name: 'Dal Tadka',
    price: 2.99,
    rating: 4.7,
    img: 'assets/dal.png',
    noOfPeople: 53,
    description: 'Comforting and flavorful lentil dish.',
    category: 'Dal',
    continent: 'Indian', // Asia for Indian cuisine
  ),
  FoodItems(
    name: 'Pizza',
    price: 9.99,
    rating: 4.6,
    img: 'assets/pizza.png',
    noOfPeople: 32,
    description: 'Delicious cheesy pizza with your favorite toppings.',
    category: 'Pizza',
    continent: 'Europe', // Europe for Italian cuisine
  ),
  FoodItems(
    name: 'Biryani',
    price: 7.99,
    rating: 4.9,
    img: 'assets/biryani.png',
    noOfPeople: 58,
    description: 'Aromatic and flavorful biryani with tender meat and spices.',
    category: 'Biryani',
    continent: 'Indian', // Asia for Indian cuisine
  ),
];



class PopularItemsGrid extends StatefulWidget {
  const PopularItemsGrid({Key? key}) : super(key: key);

  @override
  _PopularItemsGridState createState() => _PopularItemsGridState();
}

class _PopularItemsGridState extends State<PopularItemsGrid> {
  void toggle(FoodItems item) {
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
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 items per row
        crossAxisSpacing: 16, // Space between items horizontally
        mainAxisSpacing: 16,
        childAspectRatio: 0.74,
      ),
      itemCount: popularItemsList.length,
      itemBuilder: (context, index) {
        final product = popularItemsList[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodDetails(product, onCartUpdate: () {  },), // Pass the product here
              ),
            );
          },
          child:  Container(
            width: 175,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF000000).withOpacity(0.25),
                  offset: const Offset(15, 15),
                  blurRadius: 30,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 175,
                          height: 115,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Image.asset(
                              product.img,
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
                                height: 25,
                                width: 52,
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
                                      const Text(
                                        "\$",
                                        style: TextStyle(
                                          fontSize: 9.8,
                                          fontFamily: "sofia_Medium_pro",
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFFE724C),
                                        ),
                                      ),
                                      Text(
                                        product.price.toStringAsFixed(2),
                                        style: const TextStyle(
                                          fontSize: 15.25,
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
                                  toggle(product);
                                },
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: product.isFavourite
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
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: "sofia_Medium_pro",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                product.description!,
                                style: const TextStyle(
                                  color: Color(0xFF9796A1),
                                  fontFamily: "sofia_Medium_pro",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 97,
                  left: 12,
                  child: Container(
                    width: 79,
                    height: 25,
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
                          product.rating.toString(),
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
                          "(${product.noOfPeople}+)",
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
        );
      },
    );
  }
}
