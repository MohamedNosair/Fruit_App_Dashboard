import 'dart:io';

import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/review_entity.dart';

class AddProductEntity {
  final String name;
  final String description;
  final num price;
  String? imageUrl;
  final bool isFeatured;
  final File imageFile;
  final int expirationsMonths;
  final bool isOrganic;
  final num numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final num unitAmount;
  final List<ReviewEntity> reviews;

  AddProductEntity( {
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.reviews,
    required this.isFeatured,
    required this.imageFile,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false,
  });
}
