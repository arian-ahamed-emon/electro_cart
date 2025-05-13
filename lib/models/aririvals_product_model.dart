class NewArrivalsProduct {
  final double oldPrice;
  final double price;
  final double discountPrice;
  final String title;
  final String image;
  bool isFavorite;

  NewArrivalsProduct({
    required this.oldPrice,
    required this.price,
    required this.discountPrice,
    required this.title,
    required this.image,
    this.isFavorite = false,
  });
}
