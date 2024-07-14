import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/button.dart';

import '../models/food.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  // remove from cart
  void removeFromCart(Food food, int quantity, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeFromCart(food, quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 229, 83, 70),
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'My Cart',
            style: GoogleFonts.syne(
              color: Colors.white,
              fontSize: 22.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [],
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              // customer cart

              Expanded(
                child: ListView.builder(
                    itemCount: value.cart.length,
                    itemBuilder: (context, index) {
                      // get food from cart
                      final Food food = value.cart[index];

                      // get food name
                      final String foodName = food.name;

                      // get food price
                      final double foodPrice = food.price;

                      // get image path
                      final String imagePath = food.imagePath;

                      // return list tile
                      return Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    food.imagePath,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width:20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      for (var line in _splitLongText(foodName, 10))
                                      Text(
                                        line,
                                        style: GoogleFonts.syne(
                                          color: Colors.grey[900],
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '฿' + foodPrice.toStringAsFixed(2),
                                        style: GoogleFonts.syne(
                                          color: Colors.grey[800],
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete_rounded,
                                  color: Colors.grey[900],
                                ),
                                onPressed: () =>
                                    removeFromCart(food, 1, context),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              // pay button
              MyButton(
                text: 'Pay Now',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> _splitLongText(String text, int maxLengthPerLine) {
  List<String> lines = [];
  List<String> words = text.split(' ');

  String currentLine = '';
  for (int i = 0; i < words.length; i++) {
    String word = words[i];
    
    if (currentLine.isEmpty) {
      currentLine = word;
    } else {
      String testLine = '$currentLine $word';
      if (testLine.length <= maxLengthPerLine) {
        currentLine = testLine;
      } else {
        lines.add(currentLine);
        currentLine = word;
      }
    }
    
    if (i == words.length - 1) {
      lines.add(currentLine);
    }
  }

  return lines;
}
