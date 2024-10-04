import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      body: Stack(
        children: [
          // Top section images
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/left_down.png"),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/left_up.png"),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset("assets/right_up.png"),
          ),
          // Main content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 98),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 37,
                      fontFamily: "sofia_Medium_pro",
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildTextField("Full name", "Full name"),
                  const SizedBox(height: 29),
                  _buildTextField("E-mail", "E-mail"),
                  const SizedBox(height: 29),
                  _buildPasswordField(),
                  const SizedBox(height: 29),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/phoneRegistration");
                      },
                      child: Container(
                        width: 248,
                        height: 60,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFE724C),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: "sofia_Medium_pro",
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Color(0xFF5B5B5E),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: "sofia_Medium_pro",
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/login");
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 0),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Color(0xFFFE724C),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: "sofia_Medium_pro",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: const Color(0xFFB3B3B3).withOpacity(0.5),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        color: Colors.transparent,
                        child: const Text(
                          "Sign up with",
                          style: TextStyle(
                            color: Color(0xFF5B5B5E),
                            fontSize: 16,
                            fontFamily: "sofia_Medium_pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: const Color(0xFFB3B3B3).withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSocialButton("FACEBOOK", "assets/fb.png"),
                      _buildSocialButton("GOOGLE", "assets/google.png"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: "sofia_Medium_pro",
            fontWeight: FontWeight.w400,
            color: Color(0xFF9796A1),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFFE724C)),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFFE724C)),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
              borderRadius: BorderRadius.circular(10),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.fromLTRB(20, 25, 0, 23),
            hintStyle: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Color(0xFFC4C4C4),
            ),
            filled: true, // Ensures the background color is applied
            fillColor: Colors.white,
          ),
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Password",
          style: TextStyle(
            fontSize: 16,
            fontFamily: "sofia_Medium_pro",
            fontWeight: FontWeight.w400,
            color: Color(0xFF9796A1),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: 'Password',
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFFE724C)),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFFE724C)),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
              borderRadius: BorderRadius.circular(10),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.fromLTRB(20, 25, 0, 23),
            hintStyle: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Color(0xFFC4C4C4),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: _togglePasswordVisibility,
            ),
            filled: true, // Ensures the background color is applied
            fillColor: Colors.white,
          ),
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(String title, String assetPath) {
    return Container(
      width: 140,
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD3D1D8).withOpacity(0.4),
            offset: const Offset(18.59, 18.59),
            blurRadius: 37.17,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(assetPath),
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
