import 'package:hive/hive.dart';
part 'user_entity.g.dart'; 
@HiveType(typeId: 0)
class UserEntity extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String email;

  UserEntity({required this.id, required this.email});
}


 