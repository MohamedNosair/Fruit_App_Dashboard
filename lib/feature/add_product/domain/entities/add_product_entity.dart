import 'dart:io';

class AddProductEntity {
  final String name;
  final String description;
  final num price;
  final String? imageUrl;
  final bool isFeatured;
  final File imageFile;

  AddProductEntity({
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.isFeatured,
    required this.imageFile,
  });
}
