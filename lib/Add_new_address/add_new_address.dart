import 'package:flutter/material.dart';
import 'text_field.dart';
import 'button.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  // List of Indian states
  final List<String> _indianStates = [
    'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar',
    'Chhattisgarh', 'Delhi', 'Goa', 'Gujarat', 'Haryana',
    'Himachal Pradesh', 'Jharkhand', 'Karnataka', 'Kerala',
    'Madhya Pradesh', 'Maharashtra', 'Manipur', 'Meghalaya',
    'Mizoram', 'Nagaland', 'Odisha', 'Punjab', 'Rajasthan',
    'Sikkim', 'Tamil Nadu', 'Telangana', 'Tripura',
    'Uttar Pradesh', 'Uttarakhand', 'West Bengal'
  ];

  // Mapping of states to cities
  final Map<String, List<String>> _stateCityMap = {
    "Andhra Pradesh": ["Visakhapatnam", "Vijayawada", "Tirupati"],
    "Arunachal Pradesh": ["Itanagar", "Naharlagun", "Pasighat"],
    "Assam": ["Guwahati", "Silchar", "Dibrugarh"],
    "Bihar": ["Patna", "Gaya", "Bhagalpur"],
    "Chhattisgarh": ["Raipur", "Bilaspur", "Durg"],
    "Delhi": ["New Delhi", "Dwarka", "Pitampura"],
    "Goa": ["Panaji", "Margao", "Mapusa"],
    "Gujarat": ["Ahmedabad", "Surat", "Vadodara"],
    "Haryana": ["Gurugram", "Faridabad", "Hisar"],
    "Himachal Pradesh": ["Shimla", "Dharamshala", "Kullu"],
    "Jharkhand": ["Ranchi", "Jamshedpur", "Dhanbad"],
    "Karnataka": ["Bengaluru", "Mysuru", "Mangaluru"],
    "Kerala": ["Thiruvananthapuram", "Kochi", "Kozhikode"],
    "Madhya Pradesh": ["Bhopal", "Indore", "Gwalior"],
    "Maharashtra": ["Mumbai", "Pune", "Nagpur"],
    "Manipur": ["Imphal", "Thoubal", "Churachandpur"],
    "Meghalaya": ["Shillong", "Tura", "Jowai"],
    "Mizoram": ["Aizawl", "Lunglei", "Champhai"],
    "Nagaland": ["Kohima", "Dimapur", "Wokha"],
    "Odisha": ["Bhubaneswar", "Cuttack", "Rourkela"],
    "Punjab": ["Chandigarh", "Ludhiana", "Amritsar"],
    "Rajasthan": ["Jaipur", "Udaipur", "Jodhpur"],
    "Sikkim": ["Gangtok", "Namchi", "Pelling"],
    "Tamil Nadu": ["Chennai", "Coimbatore", "Madurai"],
    "Telangana": ["Hyderabad", "Warangal", "Nizamabad"],
    "Tripura": ["Agartala", "Ambassa", "Udaipur"],
    "Uttar Pradesh": ["Lucknow", "Kanpur", "Varanasi"],
    "Uttarakhand": ["Dehradun", "Haridwar", "Nainital"],
    "West Bengal": ["Kolkata", "Siliguri", "Durgapur"]
  };

  // Selected state and city
  String? _selectedState;
  String? _selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildMainContent(context),
          _buildBackButton(context),
        ],
      ),
    );
  }

  // Main content of the Add New Address screen
  Widget _buildMainContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 47),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Add new address",
            style: TextStyle(
              color: Color(0xFF111719),
              fontFamily: "sofia_Medium_pro",
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 44),
          textField("Full name", "Full name"),
          const SizedBox(height: 24),
          textField("Mobile number", "Mobile number"),
          const SizedBox(height: 24),
          _buildSelectState(),
          const SizedBox(height: 24),
          _buildSelectCity(),
          const SizedBox(height: 24),
          textField("Street (Include house number)", "Street"),
          const SizedBox(height: 29),
          buttonOrange(context, "SAVE", route: "/homeScreen"),
        ],
      ),
    );
  }

  // Back button in the top left corner
  Widget _buildBackButton(BuildContext context) {
    return Positioned(
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
    );
  }

  // Dropdown for selecting a state
  Widget _buildSelectState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "State:",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF9796A1),
          ),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: _selectedState != null ? Colors.orange : Colors.grey,
              ),
            ),
            contentPadding: const EdgeInsets.fromLTRB(20, 25, 0, 23),
          ),
          value: _selectedState,
          items: _indianStates.map((String state) {
            return DropdownMenuItem<String>(
              value: state,
              child: Text(state),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedState = newValue;
              _selectedCity = null; // Reset selected city when state changes
            });
          },
          hint: const Text(
            'Select State',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Color(0xFF111719),
            ),
          ),
        ),
      ],
    );
  }

  // Dropdown for selecting a city based on selected state
  Widget _buildSelectCity() {
    final List<String>? cities = _stateCityMap[_selectedState];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "City:",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF9796A1),
          ),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: _selectedCity != null ? Colors.orange : Colors.grey,
              ),
            ),
            contentPadding: const EdgeInsets.fromLTRB(20, 25, 0, 23),
          ),
          value: _selectedCity,
          items: _selectedState == null
              ? [const DropdownMenuItem<String>(value: "Default City", child: Text("Default City"))]
              : (cities?.map((String city) {
            return DropdownMenuItem<String>(
              value: city,
              child: Text(city),
            );
          }).toList() ?? []),
          onChanged: (String? newValue) {
            setState(() {
              _selectedCity = newValue;
            });
          },
          hint: const Text(
            'Select City',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Color(0xFF111719),
            ),
          ),
        ),
      ],
    );
  }
}
