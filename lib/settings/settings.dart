import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'General',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF323643), // Consistent text color
                fontFamily: "sofia_Medium_pro", // Use your custom font
              ),
            ),
            const SizedBox(height: 16),
            _buildSwitchTile(
              title: 'Enable Notifications',
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            _buildSwitchTile(
              title: 'Dark Mode',
              value: _darkModeEnabled,
              onChanged: (value) {
                setState(() {
                  _darkModeEnabled = value;
                  Get.changeTheme(_darkModeEnabled?ThemeData.dark():ThemeData.light());
                });
              },
            ),
            const Divider(),
            const Text(
              'Account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF323643), // Consistent text color
                fontFamily: "sofia_Medium_pro", // Use your custom font
              ),
            ),
            const SizedBox(height: 16),
            _buildListTile(
              title: 'Change Password',
              onTap: () {
                // Navigate to change password screen
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Change Password functionality not implemented')),
                );
              },
            ),
            _buildListTile(
              title: 'Privacy Policy',
              onTap: () {
                // Navigate to privacy policy screen
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Privacy Policy functionality not implemented')),
                );
              },
            ),
            _buildListTile(
              title: 'Terms of Service',
              onTap: () {
                // Navigate to terms of service screen
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Terms of Service functionality not implemented')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create a SwitchListTile
  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF323643), // Consistent text color
          fontFamily: "sofia_Medium_pro", // Use your custom font
        ),
      ),
      value: value,
      onChanged: onChanged,
    );
  }

  // Helper method to create a ListTile
  Widget _buildListTile({
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF323643), // Consistent text color
          fontFamily: "sofia_Medium_pro", // Use your custom font
        ),
      ),
      trailing: const Icon(Icons.arrow_forward, color: Color(0xFFFE724C)), // Match your theme color
      onTap: onTap,
    );
  }
}
