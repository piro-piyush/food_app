import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class PhoneRegistration extends StatefulWidget {
  const PhoneRegistration({super.key});

  @override
  State<PhoneRegistration> createState() => _PhoneRegistrationState();
}

class _PhoneRegistrationState extends State<PhoneRegistration> {
  final TextEditingController _phoneController = TextEditingController();
  String _countryCode = "+1"; // Default country code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 28, top: 180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Registration",
                  style: TextStyle(
                    fontSize: 37,
                    fontFamily: "sofia_Medium_pro",
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Enter your phone number to verify your account",
                  style: TextStyle(
                    color: Color(0xFF9796A1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 38),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CountryCodePicker(
                        onChanged: (country) {
                          setState(() {
                            _countryCode =
                                country.dialCode ?? "+91"; // Update country code
                          });
                        },
                        initialSelection: 'IN',
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: true,
                        padding: EdgeInsets.zero,
                        textStyle: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 5,
                      child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.orange,
                              width: 2.0, // Orange border on focus
                            ),
                          ),
                          labelText: 'Phone Number',
                          prefixText: _countryCode,
                          prefixStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/login");
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
                        'SEND NEW PASSWORD',
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
                Navigator.pushNamed(context, "/signUp");
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