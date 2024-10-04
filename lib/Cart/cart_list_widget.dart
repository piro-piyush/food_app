import 'package:flutter/material.dart';
import '../Home_screen/popular_items_grid.dart';

/// Represents an item in the shopping cart.
class CartItem {
  final FoodItems item;
  int qty;

  CartItem({
    required this.item,
    required this.qty,
  });
}

// List of items in the cart
List<CartItem> cartList = [];

// Widget that displays the list of cart items.
class CartListWidget extends StatefulWidget {
  final Function onQtyChanged; // Callback to notify parent of quantity changes.

  const CartListWidget({super.key, required this.onQtyChanged});

  @override
  State<CartListWidget> createState() => _CartListWidgetState();
}

class _CartListWidgetState extends State<CartListWidget> {
  void qtyIncrement(CartItem cartItem) {
    setState(() {
      cartItem.qty += 1; // Increment the quantity of the specific cart item.
    });
    widget.onQtyChanged(); // Notify parent when quantity changes.
  }

  void qtyDecrement(CartItem cartItem) {
    if (cartItem.qty > 1) {
      setState(() {
        cartItem.qty -= 1; // Decrement the quantity of the specific cart item.
      });
      widget.onQtyChanged(); // Notify parent when quantity changes.
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartList.length,
      itemBuilder: (context, index) {
        final cartItem = cartList[index];
        return _buildCartItem(cartItem);
      },
    );
  }

  Widget _buildCartItem(CartItem cartItem) {
    return Container(
      height: 138,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          _buildImage(cartItem.item.img),
          const SizedBox(width: 12),
          Expanded(
            child: _buildItemDetails(cartItem),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    return Container(
      width: 127,
      height: 127,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildItemDetails(CartItem cartItem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildItemHeader(cartItem),
        const Text(
          'Tasty Dish',
          style: TextStyle(
            color: Color(0xFF8C8A9D),
            fontFamily: "sofia_Medium_pro",
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        _buildItemFooter(cartItem),
      ],
    );
  }

  Widget _buildItemHeader(CartItem cartItem) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          cartItem.item.name,
          style: const TextStyle(
            color: Color(0xFF000000),
            fontFamily: "sofia_Medium_pro",
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              cartList.remove(cartItem); // Remove item from the cart.
            });
            widget.onQtyChanged(); // Notify parent when an item is removed.
          },
          icon: const Icon(Icons.close_sharp, color: Color(0xFFFE724C), size: 15),
        ),
      ],
    );
  }

  Widget _buildItemFooter(CartItem cartItem) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildPrice(cartItem.item.price),
        _buildQuantityControls(cartItem),
      ],
    );
  }

  Widget _buildPrice(double price) {
    return Row(
      children: [
        const Text(
          "\$",
          style: TextStyle(
            fontSize: 17.25,
            fontFamily: "sofia_Medium_pro",
            fontWeight: FontWeight.w600,
            color: Color(0xFFFE724C),
          ),
        ),
        Text(
          price.toStringAsFixed(2), // Format price to 2 decimal places.
          style: const TextStyle(
            fontSize: 17.25,
            fontFamily: "sofia_Medium_pro",
            fontWeight: FontWeight.w600,
            color: Color(0xFFFE724C),
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityControls(CartItem cartItem) {
    return Row(
      children: [
        _buildQuantityButton(Icons.remove_circle, () => qtyDecrement(cartItem)),
        const SizedBox(width: 5),
        Text(cartItem.qty.toString(), style: const TextStyle(fontSize: 19)),
        const SizedBox(width: 5),
        _buildQuantityButton(Icons.add_circle_rounded, () => qtyIncrement(cartItem)),
      ],
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFE724C).withOpacity(0.11),
            offset: const Offset(0, 7),
            blurRadius: 15,
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: const Color(0xFFFE724C)),
        iconSize: 32,
      ),
    );
  }
}
