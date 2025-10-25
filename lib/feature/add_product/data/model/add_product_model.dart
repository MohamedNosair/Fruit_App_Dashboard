import 'dart:io';

import 'package:fruit_hub_dashboard/feature/add_product/data/model/review_model.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/add_product_entity.dart';

class AddProductModel {
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
  final List<ReviewModel> reviews;

  AddProductModel({
    this.isOrganic = false,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.isFeatured,
    required this.imageFile,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
  });

  factory AddProductModel.fromEntity(AddProductEntity addProductEntity) {
    return AddProductModel(
      isOrganic: addProductEntity.isOrganic,
      name: addProductEntity.name,
      description: addProductEntity.description,
      price: addProductEntity.price,
      isFeatured: addProductEntity.isFeatured,
      imageFile: addProductEntity.imageFile,
      expirationsMonths: addProductEntity.expirationsMonths,
      numberOfCalories: addProductEntity.numberOfCalories,
      unitAmount: addProductEntity.unitAmount,
      reviews: addProductEntity.reviews
          .map((review) => ReviewModel.fromEntity(review))
          .toList(),
    );
  }

  toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((review) => review.toJson()).toList(),
    };
  }
}
