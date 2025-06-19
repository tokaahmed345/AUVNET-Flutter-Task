import 'package:hive/hive.dart';

part 'advertise_model.g.dart';

@HiveType(typeId: 2) // Make sure this typeId is unique across your models
class AdvertiseModel extends HiveObject {
  @HiveField(0)
  final String image;

  AdvertiseModel({required this.image});
  factory AdvertiseModel.fromJson(Map<String, dynamic> json) {
    return AdvertiseModel(image: json['image'] as String);
  }
}
