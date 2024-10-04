import "package:flutter/material.dart";
import '../Category/category.dart';
import "restaurent_list.dart";
import 'food_type.dart';
import 'popular_items_grid.dart';
import 'searchField.dart';

// Define list of categories (Food Types)
List<CategoryType> foodTypeList = [
  CategoryType(name: "Burger", img: "assets/burgericon.png", isSelected: true),
  CategoryType(name: "Hot Dog", img: "assets/hotdogicon.png"),
  CategoryType(name: "Pizza", img: "assets/pizzaicon.png"),
  CategoryType(name: "Momos", img: "assets/momosicon.png"),
  CategoryType(name: "Samosa", img: "assets/samosaicon.png"),
  CategoryType(name: "Fries", img: "assets/friesicon.png"),
  CategoryType(name: "Sweets", img: "assets/rasgullaicon.png"),
  CategoryType(name: "Ramen", img: "assets/ramenicon.png"),
  CategoryType(name: "Tofu", img: "assets/tofuicon.png"),
  CategoryType(name: "Paneer", img: "assets/cheeseicon.png"),
];

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: const Text(
                "What would you like to order",
                style: TextStyle(
                  color: Color(0xFF323643),
                  fontFamily: "sofia_Medium_pro",
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(height: 19),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SearchField("Find food or restaurant..."),
                const SizedBox(width: 18),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 51,
                    height: 51,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE9EDF2).withOpacity(0.5),
                          offset: const Offset(0, 15),
                          blurRadius: 30,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/tuneSearch.jpg",
                        fit: BoxFit.cover,
                        height: 19,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            getCategory(),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured Restaurants",
                  style: TextStyle(
                    color: Color(0xFF323643),
                    fontFamily: "sofia_Medium_pro",
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "View All",
                      style: TextStyle(
                        color: Color(0xFFFE724C),
                        fontFamily: "sofia_Medium_pro",
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Color(0xFFFE724C),
                      size: 10,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            GetRestaurant(), // Fixed spelling here
            const SizedBox(height: 24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Items",
                  style: TextStyle(
                    color: Color(0xFF323643),
                    fontFamily: "sofia_Medium_pro",
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const SizedBox(
              height: 250,
              child:  PopularItemsGrid()
            )],
        ),
      ),
    );
  }

  // Category List (Horizontal Scrolling)
  SizedBox getCategory() {
    return SizedBox(
      height: 98,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: foodTypeList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                for (var category in foodTypeList) {
                  category.isSelected = false;
                }
                foodTypeList[index].isSelected = true;
                selectedIndex = index;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Category(category: foodTypeList[index].name,), // Pass the product here
                  ),
                );
              });
            },
            child: Container(
              height: 98,
              width: 59,
              padding: const EdgeInsets.only(top: 5, bottom: 20),
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: foodTypeList[index].isSelected
                    ? const Color(0xFFFE724C)
                    : Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: foodTypeList[index].isSelected
                        ? const Color(0xFFFE724C).withOpacity(0.21)
                        : const Color(0xFFD3D1D8).withOpacity(0.21),
                    offset: const Offset(0, 20),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 49,
                    width: 49,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        foodTypeList[index].img,
                        height: 50,
                        width: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    foodTypeList[index].name!,
                    style: TextStyle(
                      color: foodTypeList[index].isSelected
                          ? Colors.white
                          : const Color(0xFF67666D),
                      fontSize: 11,
                      fontWeight: foodTypeList[index].isSelected
                          ? FontWeight.w500
                          : FontWeight.w400,
                      fontFamily: "Sora-Variable",
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
