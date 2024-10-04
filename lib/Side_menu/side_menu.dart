import 'package:flutter/material.dart';

import '../Add_new_address/add_new_address.dart';
import '../My_orders/orders.dart';
import '../My_orders/orders_side_bar.dart';
import '../Profile/profile.dart';
import '../contact_us/contact_us.dart';
import '../help/help.dart';
import '../payment/payment.dart';
import '../settings/settings.dart';

Drawer sideDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: Colors.white,
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(
          height: 255, // Increased height to fit content properly
          child: DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white, // Background color for the header
            ),
            margin: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 90,
                  height: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset("assets/profilePhoto.png"),
                  ),
                ),
                const SizedBox(height: 10), // Space between image and text
                const Text(
                  'Farion Wick',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "sofia_Medium_pro",
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 4), // Additional spacing between name and email
                const Text(
                  "farionwick@gmail.com",
                  style: TextStyle(
                    color: Color(0xFF9EA1B1),
                    fontFamily: "sofia_Medium_pro",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        // ListTile items without dividers
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Top section containing the Drawer items
            Column(
              children: [
                _buildDrawerItem(context, 'My Orders', 'assets/document.png',OrdersSideBar()),
                _buildDrawerItem(context, 'My Profile', 'assets/profile.png', Profile() ),
                _buildDrawerItem(context, 'Delivery Address', 'assets/location.png', AddNewAddress()),
                _buildDrawerItem(context, 'Payment Methods', 'assets/wallet.png',Payment()),
                _buildDrawerItem(context, 'Contact Us', 'assets/message.png', ContactUS()),
                _buildDrawerItem(context, 'Settings', 'assets/setting.png', Settings()),
                _buildDrawerItem(context, 'Helps & FAQs', 'assets/helps.png', Help()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 32.0), // Adjusted padding for button placement
              child: buttonWithIcon(context, "Logout"),
            ),
          ],
        ),
      ],
    ),
  );
}

GestureDetector _buildDrawerItem(BuildContext context, String title, String assetPath, Widget content) {
  return GestureDetector(
    onTap: () {
      // Close the drawer before navigating to the new page
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => content, // Pass the content here
        ),
      );
    },
    child: ListTile(
      leading: Image.asset(
        assetPath,
        height: 23,
        width: 23,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: "sofia_Medium_pro",
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    ),
  );
}


Widget buttonWithIcon(BuildContext context, String title) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, "/welcome");
    },
    child: Container(
      width: 117,
      height: 43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28.5),
        color: const Color(0xFFFE724C),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFE724C).withOpacity(0.21),
            offset: const Offset(0, 20),
            blurRadius: 30,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 9.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)),
              child: const Icon(Icons.power_settings_new,
                  color: Color(0xFFFE724C), size: 20),
            ),
            const SizedBox(width: 9), // Spacing between icon and text
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "sofia_Medium_pro",
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
