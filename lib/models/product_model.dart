import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price}) {
    
    if (id.isEmpty) throw ArgumentError('Product ID cannot be empty');
    if (name.isEmpty) throw ArgumentError('Product name cannot be empty');
    if (price < 0) throw ArgumentError('Product price cannot be negative');
  }

  Map<String, dynamic> toMap() {
    final map = {
      'id': id,
      'name': name,
      'price': price,
      'createdAt': FieldValue.serverTimestamp(), 
    };
    print('🔵 Product.toMap(): $map');
    return map;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    print('🔵 Product.fromMap() input: $map');

    
    return Product(
      id: map['id']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
    );
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, price: $price}';
  }
}
