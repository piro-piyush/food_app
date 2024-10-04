import 'package:flutter/material.dart';

class Addon {
  String name;
  String img;
  double price;
  bool isSelected;

  Addon({
    required this.name,
    required this.img,
    required this.price,
    this.isSelected = false,
  });
}

class AddonListWidget extends StatefulWidget {
  @override
  _AddonListWidgetState createState() => _AddonListWidgetState();
}

class _AddonListWidgetState extends State<AddonListWidget> {
  List<Addon> addonList = [
    Addon(name: 'Onion Rings', img: 'assets/onion.png', price: 1.30),
    Addon(name: 'Coke', img: 'assets/coke.png', price: 6.30),
    Addon(name: 'Lemon', img: 'assets/lemon.png', price: 1.30),
    Addon(name: 'Pepper Julienned', img: 'assets/addonone.png', price: 2.30),
    Addon(name: 'Baby Spinach', img: 'assets/addontwo.png', price: 4.70),
    Addon(name: 'Mushroom', img: 'assets/addonthree.png', price: 2.50),
  ];

  void toggleAddonSelection(int index) {
    setState(() {
      addonList[index].isSelected = !addonList[index].isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: addonList.length,
      itemBuilder: (context, index) {
        final addon = addonList[index];

        return GestureDetector(
          onTap: () => toggleAddonSelection(index),
          child: Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              leading: ClipOval(
                child: Image.asset(
                  addon.img,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/placeholder.png'); // Placeholder image
                  },
                ),
              ),
              title: Text(
                addon.name,
                style: const TextStyle(
                  color: Color(0xFF323643),
                  fontFamily: "sofia_Medium_pro",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "+\$${addon.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Color(0xFF323643),
                      fontFamily: "sofia_Medium_pro",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: addon.isSelected ? const Color(0xFFFE724C) : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color(0xFFFE724C),
                        width: 1.5,
                      ),
                    ),
                    child: Center(
                      child: addon.isSelected
                          ? const Icon(Icons.check, color: Colors.white, size: 20)
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
