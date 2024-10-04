import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  List<String> paymentMethods = [
    "Credit Card",
    "PayPal",
    "Google Pay",
    "Apple Pay",
  ];

  void _addPaymentMethod() {
    // Logic to add a new payment method (e.g., navigate to a new screen)
    // You can implement this functionality based on your app's requirements
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add Payment Method functionality not implemented')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose Your Payment Method',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF323643), // Consistent text color
                fontFamily: "sofia_Medium_pro", // Use your custom font
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: paymentMethods.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        paymentMethods[index],
                        style: const TextStyle(
                          color: Color(0xFF323643), // Consistent text color
                          fontFamily: "sofia_Medium_pro", // Use your custom font
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward, color: Color(0xFFFE724C)), // Match your theme color
                      onTap: () {
                        // Logic to select the payment method
                        // This can also be extended to show more details or editing options
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Selected: ${paymentMethods[index]}')),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _addPaymentMethod,
              style: ElevatedButton.styleFrom(
                iconColor: const Color(0xFFFE724C), // Match your theme color
                textStyle: const TextStyle(
                  fontFamily: "sofia_Medium_pro", // Use your custom font
                ),
              ),
              child: const Text('Add New Payment Method'),
            ),
          ],
        ),
      ),
    );
  }
}
