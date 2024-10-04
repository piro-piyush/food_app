import 'package:flutter/material.dart';
import 'cart_list_widget.dart';

class Cart extends StatefulWidget {
  final VoidCallback onCartUpdate;

  const Cart({Key? key, required this.onCartUpdate}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double tax = 0;
  double delivery = 0; // Initialize delivery to zero; will be calculated later
  double subtotal = 0;

  // Calculate subtotal from the cart items
  double calculateSubtotal(List<CartItem> cartItemList) {
    return cartItemList.fold(0.0, (total, item) => total + (item.item.price * item.qty));
  }

  // Calculate tax (12% of the subtotal)
  double calculateTax(double subtotal) => subtotal * 0.12;

  // Calculate delivery charge (number of items)
  double deliveryCharge(List<CartItem> list) => list.length.toDouble();

  @override
  void initState() {
    super.initState();
    updateCart(); // Initialize cart calculations
  }

  // Update subtotal, tax, and delivery whenever the cart changes
  void updateCart() {
    setState(() {
      subtotal = calculateSubtotal(cartList);
      tax = calculateTax(subtotal);
      delivery = deliveryCharge(cartList);
    });
  }

  @override
  Widget build(BuildContext context) {
    double total = subtotal + delivery + tax;
    return cartList.isEmpty
        ? Center(
      child: Text(
        "No favorite food items yet!",
        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
      ),
    )
        : Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 27),
      child: Column(
        children: [
          _buildCartItemsSection(),
          const SizedBox(height: 30),
          _buildPromoCodeSection("Promo Code", "Apply"),
          const SizedBox(height: 30),
          _buildPriceDetailsSection(total),
          const SizedBox(height: 50),
          _buildCheckoutButton(),
        ],
      ),
    );
  }

  Widget _buildCartItemsSection() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.33,
      child: CartListWidget(
        onQtyChanged: updateCart, // Pass the callback here
      ),
    );
  }

  Widget _buildPromoCodeSection(String hinText, String buttonText) {
    return Flexible(
      child: TextField(
        decoration: InputDecoration(
          hintText: hinText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFFE724C)),
            borderRadius: BorderRadius.circular(0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFFE724C)),
            borderRadius: BorderRadius.circular(40),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
            borderRadius: BorderRadius.circular(40),
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 11, 15),
          hintStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: Color(0xFFC4C4C4),
          ),
          filled: true,
          fillColor: Colors.white,
          suffix: _buildPromoButton(buttonText),
        ),
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildPromoButton(String buttonText) {
    return Container(
      width: 97,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29),
        color: const Color(0xFFFE724C),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFE724C).withOpacity(0.21),
            offset: const Offset(0, 20),
            blurRadius: 30,
          ),
        ],
      ),
      child: Center(
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontFamily: "sofia_Medium_pro",
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildPriceDetailsSection(double total) {
    return Column(
      children: [
        _buildPriceRow("Subtotal", subtotal),
        const Divider(),
        _buildPriceRow("Tax and Fees", tax),
        const Divider(),
        _buildPriceRow("Delivery", delivery),
        const Divider(),
        _buildTotalRow(total),
      ],
    );
  }

  Widget _buildTotalRow(double total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              "Total",
              style: TextStyle(
                fontSize: 17.25,
                fontFamily: "sofia_Medium_pro",
                fontWeight: FontWeight.w400,
                color: Color(0xFF000000),
              ),
            ),
            const SizedBox(width: 5),
            Text(
              "(${cartList.length} items)",
              style: const TextStyle(
                fontSize: 14,
                fontFamily: "sofia_Medium_pro",
                fontWeight: FontWeight.w400,
                color: Color(0xFF9796A1),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "\$${total.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 17.25,
                fontFamily: "sofia_Medium_pro",
                fontWeight: FontWeight.w400,
                color: Color(0xFF000000),
              ),
            ),
            const SizedBox(width: 5),
            const Text(
              "USD",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "sofia_Medium_pro",
                fontWeight: FontWeight.w400,
                color: Color(0xFF9796A1),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceRow(String label, double value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 17.25,
            fontFamily: "sofia_Medium_pro",
            fontWeight: FontWeight.w400,
            color: Color(0xFF000000),
          ),
        ),
        Text(
          "\$${value.toStringAsFixed(2)} USD",
          style: const TextStyle(
            fontSize: 17.25,
            fontFamily: "sofia_Medium_pro",
            fontWeight: FontWeight.w400,
            color: Color(0xFF000000),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckoutButton() {
    return GestureDetector(
      onTap: () {
        // Add your checkout logic here
      },
      child: Container(
        width: 167,
        height: 53,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.5),
          color: const Color(0xFFFE724C),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFE724C).withOpacity(0.21),
              offset: const Offset(0, 20),
              blurRadius: 30,
            ),
          ],
        ),
        child: const Center(
          child: Text(
            "CHECKOUT",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "sofia_Medium_pro",
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
