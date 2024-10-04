import 'package:flutter/material.dart';

import '../Home_screen/bottom_navigationbar.dart';
import 'orders.dart';
import 'orders_appbar.dart';

class OrdersSideBar extends StatefulWidget {
  const OrdersSideBar({super.key});

  @override
  State<OrdersSideBar> createState() => _OrdersSideBarState();
}

class _OrdersSideBarState extends State<OrdersSideBar> {
  int currentIndex = 1; // Set this to the correct index for "Orders"

  // Handle Bottom Navigation onTap
  void onTabTapped(int index) {
    setState(() {
      currentIndex = index; // Update the currentIndex when tapped
    });
    // Navigate to other screens based on the index if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOrders(context),
      body: const Orders(),
      bottomNavigationBar: buildBottomNavigationBar(
        currentIndex,
        onTabTapped,
        0,
        1,
      ),
    );
  }
}
