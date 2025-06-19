
import 'package:hive/hive.dart';

part 'restaurant_model.g.dart';

@HiveType(typeId: 1) // Assign a unique ID
class RestaurantModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String duration;

  @HiveField(2)
  final String image;

  RestaurantModel({
    required this.name,
    required this.duration,
    required this.image,
  });
  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      name: json['name'] as String,
      duration: json['duration'] as String,
      image: json['image'] as String,
    );
  }
}
