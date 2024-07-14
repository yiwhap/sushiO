import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? OnTap;
  const FoodTile({
    super.key,
    required this.food,
    required this.OnTap,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.fromLTRB(25, 0, 0, 25),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Column(
          children: [
            
            //image
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  food.imagePath,
                  height: 135,
                ),
              ],
            ),

            //name
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var line in _splitLongText(food.name, 10))
                  Text(
                    line,
                    style: GoogleFonts.syne(
                      fontSize: 20,
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                //price + rating
                SizedBox(
                  width: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // price
                      Text(
                        '\฿' + food.price.toStringAsFixed(2),
                        style: GoogleFonts.syne(
                          fontSize: 18,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      // rating
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[800],
                            size: 18,
                          ),
                          SizedBox(width: 5,),
                          Text(
                            food.rating.toStringAsFixed(2),
                            style: GoogleFonts.syne(
                              fontSize: 18,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
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


