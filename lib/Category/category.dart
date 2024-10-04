import 'package:flutter/material.dart';
import 'category_list_widget.dart';
import 'list.dart';

class Category extends StatefulWidget {
  final String? category;

  const Category({required this.category, super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  int availableItems(String category) {
    switch (category.toLowerCase()) {
      case 'sweets':
        return sweetsList.length;
      case 'momos':
        return momosList.length;
      case 'pizza':
        return pizzaList.length;
      case 'samosa':
        return samosaList.length;
      default:
        return 0; // Return 0 if the category does not match
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Uncomment and modify the following lines to add background images if needed
          // Positioned(
          //   top: -210,
          //   right: -190,
          //   child: ClipRRect(
          //     child: Image.asset("assets/pizzafull.png", fit: BoxFit.cover),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 47),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Navigate back to the previous screen
                  },
                  child: Container(
                    height: 38,
                    width: 38,
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x4DD3D1D8),
                          offset: Offset(5, 10),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 17),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Fast",
                      style: TextStyle(
                        color: Color(0xFF323643),
                        fontFamily: "sofia_Medium_pro",
                        fontWeight: FontWeight.w700,
                        fontSize: 45,
                      ),
                    ),
                    const Text(
                      "Food",
                      style: TextStyle(
                        color: Color(0xFFFE724C),
                        fontFamily: "sofia_Medium_pro",
                        fontWeight: FontWeight.w700,
                        fontSize: 55,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "${availableItems(widget.category ?? '')} types of ${widget.category?.toLowerCase() ?? 'food'}",
                      style: const TextStyle(
                        color: Color(0xFF9796A1),
                        fontFamily: "sofia_Medium_pro",
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 52),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Sort by:",
                          style: TextStyle(
                            color: Color(0xFF111719),
                            fontFamily: "sofia_Medium_pro",
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Popular",
                          style: TextStyle(
                            color: Color(0xFFFE724C),
                            fontFamily: "sofia_Medium_pro",
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down_rounded, size: 12, color: Colors.grey),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFE9EDF2).withOpacity(0.5),
                              offset: const Offset(0, 15),
                              blurRadius: 30,
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
                const SizedBox(height: 20),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      // Use switch-case to determine the appropriate widget to display
                      switch (widget.category?.toLowerCase()) {
                        case 'sweets':
                          return CategoryListWidget(itemList: sweetsList);
                        case 'momos':
                          return CategoryListWidget(itemList: momosList);
                        case 'pizza':
                          return CategoryListWidget(itemList: pizzaList);
                        case 'samosa':
                          return CategoryListWidget(itemList: samosaList);
                        default:
                          return const Center(
                            child: Text(
                              'Category not found!',
                              style: TextStyle(
                                fontFamily: 'sofia_Medium_pro',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
