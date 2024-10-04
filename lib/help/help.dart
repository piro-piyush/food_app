import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        centerTitle: true, // Center the title for a more balanced look
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar for finding help topics
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for help...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  borderSide: const BorderSide(color: Color(0xFFFE724C)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFFE724C)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                suffixIcon: const Icon(Icons.search, color: Color(0xFFFE724C)),
              ),
            ),
            const SizedBox(height: 20),
            // Help topics
            const Text(
              'Common Help Topics:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('How to use the app?'),
                    onTap: () {
                      // Navigate to a detailed help page
                    },
                  ),
                  ListTile(
                    title: const Text('Payment Issues'),
                    onTap: () {
                      // Navigate to a detailed help page
                    },
                  ),
                  ListTile(
                    title: const Text('Order Tracking'),
                    onTap: () {
                      // Navigate to a detailed help page
                    },
                  ),
                  ListTile(
                    title: const Text('Contact Support'),
                    onTap: () {
                      // Navigate to a detailed help page or support contact
                    },
                  ),
                ],
              ),
            ),
            // Contact information
            const SizedBox(height: 20),
            const Text(
              'For further assistance, please contact:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text('Email: support@example.com'),
            const Text('Phone: +1 (123) 456-7890'),
          ],
        ),
      ),
    );
  }
}
