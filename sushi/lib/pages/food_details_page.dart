import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/models/food.dart';

import '../models/shop.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;

  const FoodDetailsPage({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  // quantity
  int quantityCount = 0;

  // decrement
  void decrementQuantitiy() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      } else {
        quantityCount = 0;
      }
    });
  }

  // increment
  void incrementQuantitiy() {
    setState(() {
      quantityCount++;
    });
  }

  // add to cart
  void addToCart() {
    // only add to cart if there is something in the cart
    if (quantityCount > 0) {
      // get access to shop
      final shop = context.read<Shop>();

      // add to cart
      shop.addToCart(widget.food, quantityCount);

      // let the user know it was successful
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: Color.fromARGB(255, 229, 83, 70),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Text(
            'Successfully added to cart',
            style: GoogleFonts.syne(
              fontSize: 18,
              color: Colors.white,
              ),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: () {
                // pop once to remove dialog box
                Navigator.pop(context);

                // pop agian to go previous screen
                Navigator.pop(context);

              },
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[800],
      ),
      body: Column(
        children: [
          // listview of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: -35,
                          blurRadius: 35,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      widget.food.imagePath,
                      height: 290,
                    ),
                  ),

                  // rating
                  Row(
                    children: [
                      //star icon
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      //rating
                      Text(
                        widget.food.rating.toStringAsFixed(2),
                        style: GoogleFonts.syne(
                          fontSize: 20,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),

                  // food name
                  Text(widget.food.name,
                      style: GoogleFonts.syne(
                        fontSize: 30,
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                      )),

                  SizedBox(
                    height: 15,
                  ),

                  // description
                  Text(
                    'Description',
                    style: GoogleFonts.syne(
                      fontSize: 18,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    'Freshly sliced sushi atop seasoned rice offers vibrant flavors and balanced textures. Each savory bite, complemented by a hint of wasabi and pickled ginger, celebrates authentic Japanese simplicity.',
                    style: GoogleFonts.syne(
                      fontSize: 14,
                      color: Colors.grey[800],
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // price + quantity
          Container(
            color: Color.fromARGB(255, 229, 83, 70),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              children: [
                // price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // price
                    Text(
                      '\฿' + widget.food.price.toStringAsFixed(2),
                      style: GoogleFonts.syne(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    // quantity
                    Row(
                      children: [
                        // minus button
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 230, 107, 96),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.remove),
                            color: Colors.white,
                            onPressed: () {
                              decrementQuantitiy();
                            },
                          ),
                        ),

                        // quantity
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: GoogleFonts.syne(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        // plus button
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 230, 107, 96),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add),
                            color: Colors.white,
                            onPressed: () {
                              incrementQuantitiy();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // add to cart button
                MyButton(
                  text: 'Add To Cart',
                  onTap: addToCart,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
