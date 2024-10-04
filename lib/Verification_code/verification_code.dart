import 'package:flutter/material.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      body: Stack(
        children: [
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
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/left_down.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 28, top: 180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Verification Code",
                  style: TextStyle(
                    fontSize: 37,
                    fontFamily: "sofia_Medium_pro",
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Please type the verification code sent to (+1) 230-333-0181",
                  style: TextStyle(
                    color: Color(0xFF9796A1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 30),
                // OTP Input Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    return SizedBox(
                      height: 65,
                      width: 65,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFE724C), // Text color for the digits
                        ),
                        cursorColor: const Color(0xFFFE724C), // Orange cursor
                        decoration: InputDecoration(
                          counterText: "",
                          filled: true,
                          fillColor: Colors.white, // Background color for the text field
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFEEEEEE), // Default border color
                              width: 1.0, // Border width set to 1px
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFC4C4C4), // Gray border when not focused
                              width: 1.0, // Border width set to 1px
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFE724C), // Orange border when focused
                              width: 1.0, // Border width set to 1px
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.length == 1 && index < 3) {
                            // Move focus to the next TextField
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "I didn’t receive a code! ",
                      style: TextStyle(
                        color: Color(0xFF5B5B5E),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: "sofia_Medium_pro",
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Resend code logic
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                      ),
                      child: const Text(
                        "Please resend",
                        style: TextStyle(
                          color: Color(0xFFFE724C),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: "sofia_Medium_pro",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/homeScreen");
                    },
                    child: Container(
                      width: 248,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFE724C),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x297A81BE),
                            offset: Offset(0, 10),
                            blurRadius: 40,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'VERIFY CODE',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 37,
            left: 27,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/phoneRegistration");
              },
              child: Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x4DD3D1D8),
                      offset: Offset(5, 10),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
