import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image for the profile page
          Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/profileBg.png",
              fit: BoxFit
                  .cover, // Makes the background image cover the entire width
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.14),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(64),
                          ),
                          child: Stack(
                            children: [
                              // White circular background
                              Center(
                                  child: Container(
                                height: 108,
                                width: 108  ,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(60)),
                              )),
                              // Profile photo inside a circular border
                              Center(
                                child: Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFFFC529).withOpacity(0.2),
                                        offset: Offset(0, 15),
                                        // X and Y offsets
                                        blurRadius: 20,
                                        // Blur effect
                                        spreadRadius: 0, // Spread effect
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(45),
                                    child:
                                        Image.asset("assets/profilePhoto.png"),
                                  ),
                                ),
                              ),
                              // Camera icon to change profile photo
                              Positioned(
                                right: 0,
                                bottom: -10,
                                child: GestureDetector(
                                  onTap: () {
                                    // Function to change the profile photo
                                  },
                                  child: Image.asset("assets/camera.png"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    const Text(
                      "Eljad Eendaz", // Displayed username
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "sofia_Medium_pro",
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Edit Profile", // Button to edit profile
                      style: TextStyle(
                        color: Color(0xFF9796A1),
                        fontFamily: "sofia_Medium_pro",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 49),
                // User information fields with pre-filled data
                Column(
                  children: [
                    _buildTextField("Full name", "Full name", "Eljad Eendaz"),
                    const SizedBox(height: 29),
                    _buildTextField(
                        "E-mail", "E-mail", "prelookstudio@gmail.com"),
                    const SizedBox(height: 29),
                    _buildTextField(
                        "Phone Number", "Phone Number", "+1 (783) 0986 8786"),
                    const SizedBox(height: 49),
                    _buildButton("SAVE"),
                  ],
                ),
              ],
            ),
          ),
          // Back button positioned in the top left corner
          Positioned(
            top: 37,
            left: 27,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/homeScreen");
              },
              child: Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
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
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to create text fields with pre-filled values
  Widget _buildTextField(String label, String hint, String prewrittenText) {
    // Text controller to handle pre-filled text
    TextEditingController controller =
        TextEditingController(text: prewrittenText);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Field label
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
        // Text input field with pre-filled text
        TextField(
          controller: controller,
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
            contentPadding: const EdgeInsets.fromLTRB(20, 25, 0, 23),
            hintStyle: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Color(0xFFC4C4C4),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // Method to create the "SAVE" button
  Widget _buildButton(String label) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/homeScreen");
      },
      child: Center(
        child: Container(
          width: 248,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFFE724C),
            borderRadius: BorderRadius.circular(28.5),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFE724C).withOpacity(0.40),
                offset: const Offset(0, 20),
                blurRadius: 30,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "sofia_Medium_pro",
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
