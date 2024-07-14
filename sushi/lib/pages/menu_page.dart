import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/models/food.dart';
import 'package:sushi/pages/cart_page.dart';
import 'food_details_page.dart';
import '../components/food_tile.dart';
import '../models/shop.dart'; // Assuming your Shop class is imported correctly

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // navigate to food item details page
  void navigateToFoodDetails(int index) {
    // get the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(food: foodMenu[index]),
      ),
    );
  }


  Food? getHighestRatedFood() {
    // get the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    double maxRating = double.negativeInfinity;
    Food? highestRatedFood;

    for (var food in foodMenu) {
      if (food.rating > maxRating) {
        maxRating = food.rating;
        highestRatedFood = food;
      }
    }
    return highestRatedFood;
  }

  @override
  Widget build(BuildContext context) {
    // get the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Food? highestRatedFood = getHighestRatedFood();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          'SushiO',
          style: GoogleFonts.syne(
            color: Colors.grey[900],
            fontSize: 22.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // cart button
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.grey[900],
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 229, 83, 70),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // promo banner
                    Text(
                      'Get 20% off',
                      style: GoogleFonts.syne(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'on your first order',
                      style: GoogleFonts.syne(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // redeem code
                    MyButton(
                      text: 'Redeem',
                      onTap: () {},
                    ),
                  ],
                ),
                // promo image
                Padding(
                  padding: const EdgeInsets.only(left: 12.5),
                  child: Image.asset(
                    'lib/images/sushi-5.png',
                    height: 141.6,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search here',
                hintStyle: GoogleFonts.syne(
                  fontSize: 16,
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[600],
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!),
                    borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),

          const SizedBox(height: 25),

          // menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Menu',
              style: GoogleFonts.syne(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[900],
              ),
            ),
          ),

          const SizedBox(height: 12.5),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                OnTap: () => navigateToFoodDetails(index),
              ),
            ),
          ),

          // Highest rated food
          if (highestRatedFood != null) ...[
            Container(
              margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // image
                  Row(
                    children: [
                      Image.asset(
                        highestRatedFood.imagePath,
                        height: 105,
                      ),

                      SizedBox(width: 20),

                      // name + price + rating
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            highestRatedFood.name,
                            style: GoogleFonts.syne(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[900],
                            ),
                          ),
                          Text(
                            '\฿${highestRatedFood.price.toStringAsFixed(2)}',
                            style: GoogleFonts.syne(
                              fontSize: 18,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // heart
                  Icon(
                    Icons.favorite_outline,
                    color: Colors.grey[600],
                    size: 28,
                  )
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
