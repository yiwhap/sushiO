class Food {
  String name;
  double price;
  String imagePath;
  double rating;

  Food({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
  });

  String get _name => name;
  double get _price => price;
  String get _imagePath => imagePath;
  double get _rating => rating;
}
