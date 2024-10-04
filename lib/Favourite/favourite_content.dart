import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'fav_food_items.dart';  // Assuming these are your custom widgets
import 'fav_restaurent.dart';  // Corrected spelling

class FavouriteContent extends StatefulWidget {
  const FavouriteContent({super.key});

  @override
  State<FavouriteContent> createState() => _FavouriteContentState();
}

class _FavouriteContentState extends State<FavouriteContent> {
  int selectedIndex = 0;  // Controls which content to show

  @override
  void initState() {
    super.initState();
    _loadSelectedTab();  // Load the saved tab on initialization
  }

  // Load the saved tab index from SharedPreferences
  Future<void> _loadSelectedTab() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedIndex = prefs.getInt('selectedIndex') ?? 0;
    });
  }

  // Save the selected tab index to SharedPreferences
  Future<void> _saveSelectedTab(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selectedIndex', index);
  }

  // Toggle between food items and restaurant tabs
  void toggle(int value) {
    setState(() {
      selectedIndex = value;  // Set selected index
      _saveSelectedTab(selectedIndex);  // Save the selected tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          _buildTabBar(),
          const SizedBox(height: 20),
          Expanded(
            child: getContent(selectedIndex),
          ),
        ],
      ),
    );
  }

  // Method to build the tab bar
  Widget _buildTabBar() {
    return Container(
      height: 55,
      width: 323,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xFFF2EAEA),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTabButton("Food Items", 0),
            _buildTabButton("Restaurants", 1),
          ],
        ),
      ),
    );
  }

  // Method to build individual tab buttons
  Widget _buildTabButton(String title, int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => toggle(index),
      child: Container(
        width: 158,
        height: 47,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFE724C) : const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: "sofia_Medium_pro",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: isSelected ? const Color(0xFFFFFFFF) : const Color(0xFFFE724C),
            ),
          ),
        ),
      ),
    );
  }

  // This function returns the correct widget based on the selectedIndex
  Widget getContent(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const FavFoodItems();  // Assume these are defined elsewhere
      case 1:
        return const FavRestaurant();  // Corrected spelling
      default:
        return const FavFoodItems();
    }
  }
}
