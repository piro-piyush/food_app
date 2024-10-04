import 'package:flutter/material.dart';
import '../Cart/cart_list_widget.dart';
import '../Favourite/fav_food_items.dart';
import '../Home_screen/popular_items_grid.dart';
import 'addon.dart';

class FoodDetails extends StatefulWidget {
  final FoodItems item;
  final VoidCallback onCartUpdate; // Add a callback to update the cart count

  const FoodDetails(this.item, {super.key, required this.onCartUpdate});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int qty = 1;

  void toggleFavorite(FoodItems item) {
    setState(() {
      item.isFavourite = !item.isFavourite;
      if (item.isFavourite) {
        favFoodItems.add(item);
      } else {
        favFoodItems.remove(item);
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      qty++;
    });
  }

  void decrementQuantity() {
    if (qty > 1) {
      setState(() {
        qty--;
      });
    }
  }

  void _addToCart() {
    final existingCartItem = cartList.firstWhere(
          (cartItem) => cartItem.item.name == widget.item.name,
      orElse: () => CartItem(item: widget.item, qty: 0), // If not found, create a new one
    );

    if (existingCartItem.qty == 0) {
      cartList.add(CartItem(item: widget.item, qty: qty));
    } else {
      setState(() {
        existingCartItem.qty += qty;
      });
    }

    // Call the callback to update the cart count
    widget.onCartUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 55),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageSection(),
            const SizedBox(height: 16),
            _buildFoodTitle(),
            const SizedBox(height: 12),
            _buildRatingAndReview(),
            const SizedBox(height: 12),
            _buildPriceAndQuantity(),
            const SizedBox(height: 16),
            _buildDescription(),
            const SizedBox(height: 16),
            Flexible(child: _buildAddOnSection()),
            const SizedBox(height: 38),
            Center(child: _buildAddToCartButton()),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return SizedBox(
      width: double.infinity,
      height: 256,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              widget.item.img,
              width: double.infinity,
              height: 256,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.09),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBackButton(),
                _buildFavoriteButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
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
        child: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
      ),
    );
  }

  Widget _buildFavoriteButton() {
    return GestureDetector(
      onTap: () => toggleFavorite(widget.item),
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: widget.item.isFavourite ? const Color(0xFFFE724C) : const Color(0xFF9796A1),
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(Icons.favorite, color: Colors.white, size: 24),
        ),
      ),
    );
  }

  Widget _buildFoodTitle() {
    return Text(
      widget.item.name,
      style: const TextStyle(
        color: Color(0xFF323643),
        fontFamily: "sofia_Medium_pro",
        fontWeight: FontWeight.w600,
        fontSize: 28,
      ),
    );
  }

  Widget _buildRatingAndReview() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.star_outlined, color: Color(0xFFFFC529), size: 15),
        const SizedBox(width: 4),
        Text(
          widget.item.rating.toString(),
          style: const TextStyle(
            fontSize: 14,
            fontFamily: "sofia_Medium_pro",
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          "(${widget.item.noOfPeople}+)".toString(),
          style: const TextStyle(
            fontFamily: "sofia_Medium_pro",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF9796A1),
          ),
        ),
        if (widget.item.noOfPeople != null && widget.item.noOfPeople! > 0) const SizedBox(width: 7),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/reviews");
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            "See Review",
            style: TextStyle(
              color: Color(0xFFFE724C),
              fontSize: 15,
              fontFamily: "sofia_Medium_pro",
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
              decorationColor: Color(0xFFFE724C),
              decorationThickness: 2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceAndQuantity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              "\$",
              style: TextStyle(
                fontSize: 17.25,
                fontFamily: "sofia_Medium_pro",
                fontWeight: FontWeight.w500,
                color: Color(0xFFFE724C),
              ),
            ),
            Text(
              widget.item.price.toString(),
              style: const TextStyle(
                fontSize: 31,
                fontFamily: "sofia_Medium_pro",
                fontWeight: FontWeight.w600,
                color: Color(0xFFFE724C),
              ),
            ),
          ],
        ),
        _buildQuantityControls(),
      ],
    );
  }

  Widget _buildQuantityControls() {
    return Row(
      children: [
        IconButton(
          onPressed: decrementQuantity,
          icon: const Icon(Icons.remove_circle, color: Color(0xFFFE724C)),
        ),
        const SizedBox(width: 5),
        Text(qty.toString(), style: const TextStyle(fontSize: 19)),
        const SizedBox(width: 5),
        IconButton(
          onPressed: incrementQuantity,
          icon: const Icon(Icons.add_circle_rounded, color: Color(0xFFFE724C)),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Text(
      widget.item.description?.isNotEmpty == true ? widget.item.description! : "No description available.",
      style: const TextStyle(
        color: Color(0xFF858992),
        fontFamily: "sofia_Medium_pro",
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
    );
  }

  Widget _buildAddOnSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Choice of Add On",
          style: TextStyle(
            color: Color(0xFF323643),
            fontFamily: "sofia_Medium_pro",
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        Flexible(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.37,
            child: AddonListWidget(),
          ),
        ),
      ],
    );
  }

  Widget _buildAddToCartButton() {
    return GestureDetector(
      onTap: _addToCart,
      child: Container(
        width: 167,
        height: 53,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.5),
          color: const Color(0xFFFE724C),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 9.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.shopping_bag_rounded,
                  color: Color(0xFFFE724C),
                  size: 20,
                ),
              ),
              const SizedBox(width: 9),
              const Text(
                "Add to cart",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "sofia_Medium_pro",
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
