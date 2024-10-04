import 'package:flutter/material.dart';


// Function to build the Bottom Navigation Bar
BottomNavigationBar buildBottomNavigationBar(int currentIndex, Function(int) onTap, int cartCount, int notificationCount) {
  return BottomNavigationBar(
    currentIndex: currentIndex,
    onTap: onTap, // Pass the onTap function as a parameter
    type: BottomNavigationBarType.fixed,
    items: [
      _buildBottomNavigationBarItem(Icons.explore, 'Home', 0, 0, currentIndex),
      _buildBottomNavigationBarItem(Icons.location_on_rounded, 'Orders', 1, 0, currentIndex),
      _buildBottomNavigationBarItem(Icons.shopping_bag_rounded, 'Cart', 2, cartCount, currentIndex),
      _buildBottomNavigationBarItem(Icons.favorite, 'Favorite', 3, 0, currentIndex),
      _buildBottomNavigationBarItem(Icons.notifications, 'Notification', 4, notificationCount, currentIndex),
    ],
    selectedItemColor: const Color(0xFFFE724C),
    unselectedItemColor: const Color(0xFFD3D1D8),
  );
}

// Function to create individual Bottom Navigation Bar Items
BottomNavigationBarItem _buildBottomNavigationBarItem(IconData icon, String label, int index, int notificationCount, int currentIndex) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0), // Adjust horizontal padding for spacing
      child: buildIconWithBadge(icon, index, notificationCount, currentIndex),
    ),
    label: label, // Provide a label for accessibility
  );
}

// Function to build the icon with a notification badge
Widget buildIconWithBadge(IconData icon, int index, int notificationCount, int currentIndex) {
  return Stack(
    children: [
      Icon(
        icon,
        color: currentIndex == index ? const Color(0xFFFE724C) : const Color(0xFFD3D1D8),
        size: 28,
      ),
      if (notificationCount > 0) // Show badge only if notificationCount > 0
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 15,
            height: 15,
            decoration: const BoxDecoration(
              color: Color(0xFFFFC529),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                notificationCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "sofia_Medium_pro",
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
    ],
  );
}
