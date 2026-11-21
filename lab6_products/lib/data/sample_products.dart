import '../models/product.dart';

/// In-memory list of sample products. Every id is unique.
const List<Product> sampleProducts = [
  Product(
    id: 'P-001',
    title: 'Wireless Mouse',
    description: 'Comfortable wireless mouse for daily work.',
    rating: 4.5,
    price: 599,
  ),
  Product(
    id: 'P-002',
    title: 'Notebook Set',
    description: 'Set of three ruled notebooks for notes and lectures.',
    rating: 4.2,
    price: 120,
  ),
  Product(
    id: 'P-003',
    title: 'Desk Lamp',
    description: 'Adjustable LED desk lamp with warm and cool light modes.',
    rating: 4.7,
    price: 850,
  ),
  Product(
    id: 'P-004',
    title: 'USB Flash Drive',
    description: '64GB flash drive for storing and moving school files.',
    rating: 4.4,
    price: 350,
  ),
  Product(
    id: 'P-005',
    title: 'Mechanical Keyboard',
    description: 'Compact keyboard with tactile keys for comfortable typing.',
    rating: 4.6,
    price: 1899,
  ),
  Product(
    id: 'P-006',
    title: 'Water Bottle',
    description: 'Insulated 750ml bottle that keeps drinks cold for hours.',
    rating: 4.3,
    price: 249,
  ),
];