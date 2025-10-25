
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String comment;
  final String date;
  final String imageUrl;
  final num rating;

  ReviewModel({
    required this.name,
    required this.comment,
    required this.date,
    required this.imageUrl,
    required this.rating,
  });

factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      comment: reviewEntity.comment,
      date: reviewEntity.date,
      imageUrl: reviewEntity.imageUrl,
      rating: reviewEntity.rating,
    );
  }
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      comment: json['comment'],
      date: json['date'],
      imageUrl: json['imageUrl'],
      rating: json['rating'],
    );
  }

  toJson() {
    return {
      'name': name,
      'comment': comment,
      'date': date,
      'imageUrl': imageUrl,
      'rating': rating,
    };
  }
}




