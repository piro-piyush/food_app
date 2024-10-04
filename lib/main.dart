import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import Screens
import 'main_barrel.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: _buildRoutes(),
    );
  }

  // Method to build the routes in a cleaner way
  Map<String, WidgetBuilder> _buildRoutes() {
    return {
      "/": (context) => const SplashScreen(),
      "/welcome": (context) => const Welcome(),
      "/signUp": (context) => const SignUp(),
      "/login": (context) => const Login(),
      "/resetPassword": (context) => const ResetPassword(),
      "/verificationCode": (context) => const VerificationCode(),
      "/phoneRegistration": (context) => const PhoneRegistration(),
      "/homeScreen": (context) => const HomeScreen(),
      "/profile": (context) => const Profile(),
      "/addNewAddress": (context) => const AddNewAddress(),
      "/reviews": (context) => const Reviews(),
      "/reviewRestaurent": (context) => const ReviewRestaurent(),
    };
  }
}
