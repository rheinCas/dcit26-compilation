/// A simple immutable product model.
/// "Immutable" means every field is final: once created, it can't change.
class Product {
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.rating,
    required this.price,
  });

  final String id; // unique product identifier (the "key" in the lab)
  final String title;
  final String description;
  final double rating;
  final double price; // extra field, shown in the expected output
}