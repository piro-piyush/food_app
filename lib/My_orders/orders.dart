import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'history.dart';
import 'upcoming.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  bool isSelected = true;  // Controls whether the first tab is selected
  int selectedIndex = 0;   // Controls which content to show

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
      isSelected = selectedIndex == 0;  // Set isSelected based on index
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
      selectedIndex = value;
      isSelected = value == 0;  // Set selected to true if the first tab is selected
      _saveSelectedTab(selectedIndex);  // Save the selected tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          Container(
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
                  GestureDetector(
                    onTap: () {
                      toggle(0);
                    },
                    child: Container(
                      width: 158,
                      height: 47,
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFFE724C) : const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Center(
                        child: Text(
                          "Upcoming",
                          style: TextStyle(
                            fontFamily: "sofia_Medium_pro",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: isSelected ? const Color(0xFFFFFFFF) : const Color(0xFFFE724C),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      toggle(1);
                    },
                    child: Container(
                      width: 158,
                      height: 47,
                      decoration: BoxDecoration(
                        color: !isSelected ? const Color(0xFFFE724C) : const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Center(
                        child: Text(
                          "History",
                          style: TextStyle(
                            fontFamily: "sofia_Medium_pro",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: !isSelected ? const Color(0xFFFFFFFF) : const Color(0xFFFE724C),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(  // Use Expanded to ensure content expands and scrolls properly
            child: getContent(selectedIndex),
          ),
        ],
      ),
    );
  }

  Widget getContent(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const Upcoming();  // Assume these are defined elsewhere
      case 1:
        return const History();
      default:
        return const Upcoming();
    }
  }
}
