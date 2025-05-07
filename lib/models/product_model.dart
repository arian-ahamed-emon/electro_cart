class Product {
  final String title;
  final String image;
  final int price;
  final int discountedPrice;
  final double oldPrice;

  Product(this.oldPrice, {
    required this.title,
    required this.image,
    required this.price,
    required this.discountedPrice,
  });

  int get discountPercent {
    return ((1 - discountedPrice / price) * 100).round();
  }

}