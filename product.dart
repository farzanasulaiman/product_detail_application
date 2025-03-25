// models/product.dart
class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String thumbnail;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.thumbnail,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Unknown',
      description: json['description'] ?? 'No description available',
      price: _parseDouble(json['price']),
      discountPercentage: _parseDouble(json['discountPercentage']),
      rating: _parseDouble(json['rating']),
      stock: json['stock'] ?? 0,
      brand: json['brand'] ?? 'Unknown',
      thumbnail: json['thumbnail'] ?? 'https://placeholder.com/300',
      images: json['images'] != null
          ? List<String>.from(json['images'])
          : [],
    );
  }

  // Helper method to parse different numeric formats
  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) {
      try {
        return double.parse(value);
      } catch (_) {
        return 0.0;
      }
    }
    return 0.0;
  }
}