class Product {
  final String name;
  final String imageUrl;
  final double price;
  final double mrp;
  final double weight;
  final String? pieceCount;
  final double rating;
  final int reviewCount;
  final int deliveryTime;
  final double discount;
  final bool isPremium;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.mrp,
    required this.weight,
    this.pieceCount,
    required this.rating,
    required this.reviewCount,
    required this.deliveryTime,
    required this.discount,
    this.isPremium = false,
  });
}
