import 'package:flutter/material.dart';
import '../Cart/app_bar_cart.dart';
import '../Cart/cart.dart';
import '../Cart/cart_list_widget.dart';
import '../Favourite/appBarFav.dart';
import '../Favourite/favourite_content.dart';
import '../My_orders/orders.dart';
import '../My_orders/orders_appbar.dart';
import '../Notification/app_bar_notification.dart';
import '../Notification/notification.dart';
import '../Side_menu/side_menu.dart';
import 'app_bar_home.dart';
import 'bottom_navigationbar.dart';
import 'home_screen_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Track the active tab index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      appBar: _getAppBar(_currentIndex),
      drawer: sideDrawer(context),
      bottomNavigationBar: buildBottomNavigationBar(
          _currentIndex,
              (index) {
            setState(() {
              _currentIndex = index; // Update the index on tab change
            });
          },
          cartList.length, // Pass current cart count
          notificationList.length // Pass current notification count
      ),
      body: _getBody(_currentIndex),
    );
  }


  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const HomeContent();
      case 1:
        return const Orders();
      case 2:
        return Cart(onCartUpdate: updateCounts); // Pass callback to Cart
      case 3:
        return const FavouriteContent();
      case 4:
        return NotificationContent(onNotificationUpdate: updateCounts); // Pass callback to Notifications
      default:
        return const HomeContent();
    }
  }

  // Callback to update the counts
  void updateCounts() {
    setState(() {}); // Trigger UI update
  }

  // Dynamically set the AppBar based on the selected tab index
  PreferredSizeWidget _getAppBar(int index) {
    switch (index) {
      case 0:
        return appBarHome(context);
      case 1:
        return appBarOrders(context);
      case 2:
        return appBarCart(context);
      case 3:
        return appBarFav(context);
      case 4:
        return appBarNotification(context);
      default:
        return appBarHome(context);
    }
  }
}
