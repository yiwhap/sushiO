import 'package:flutter/material.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
  // food menu
  final List<Food> _foodMenu = [
    Food(
    name: 'Salmon',
    price: 30.00,
    imagePath: 'lib/images/sushi-7.png',
    rating: 4.95),
    Food(
        name: 'Sweet Egg',
        price: 15.00,
        imagePath: 'lib/images/sushi-8.png',
        rating: 4.90),

    Food(
        name: 'Shrimp',
        price: 30.00,
        imagePath: 'lib/images/sushi-9.png',
        rating: 4.90),
    Food(
        name: 'Otoro',
        price: 40.00,
        imagePath: 'lib/images/sushi-6.png',
        rating: 4.98),
    Food(
        name: 'Smoked Salmon',
        price: 30.00,
        imagePath: 'lib/images/sushi.png',
        rating: 4.88),
    Food(
        name: 'Mixed Maki',
        price: 25.00,
        imagePath: 'lib/images/sushi-4.png',
        rating: 4.60),
    Food(
        name: 'Sashimi',
        price: 290.00,
        imagePath: 'lib/images/sashimi.png',
        rating: 4.69),
    Food(
        name: 'Spawn Maki',
        price: 40.00,
        imagePath: 'lib/images/sushi-3.png',
        rating: 4.69),
    Food(
        name: 'Shrimp Egg Temaki',
        price: 50.00,
        imagePath: 'lib/images/temaki-1.png',
        rating: 4.67),
    Food(
        name: 'Salmon Temaki',
        price: 55.00,
        imagePath: 'lib/images/temaki-2.png',
        rating: 4.62),
    Food(
        name: 'Strawberry Daifuku',
        price: 35.00,
        imagePath: 'lib/images/daifuku-1.png',
        rating: 4.60),
    Food(
        name: 'Red Bean Daifuku',
        price: 30.00,
        imagePath: 'lib/images/daifuku-2.png',
        rating: 4.60),
    Food(
        name: 'Green Tea Daifuku',
        price: 35.00,
        imagePath: 'lib/images/daifuku-3.png',
        rating: 4.59),
  ];

  // customer cart
  List<Food> _cart = [];

  // getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.remove(foodItem);
    }
    notifyListeners();
  }

}
