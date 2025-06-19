import 'dart:developer';
import 'package:e_commerce_ui/core/utils/constants/constants.dart';
import 'package:e_commerce_ui/features/authentication/domain/entities/user_entity.dart';
import 'package:hive/hive.dart';

class CacheUser {
  void saveUserData(UserEntity user ) async {
 
    var box = Hive.box(userBoxKey);
    try {
      await box.addAll([user]);
      log('User data saved successfully: ${user.email}');
    } catch (e) {
      log('Error saving user data: $e');
    }
  }

  // Load user data from Hive
   getUser( ) {
     var box = Hive.box(userBoxKey);
     
     var users = box.values.toList();
      return users;
    
  }

  void clear() {
    // box.deleteAll([userKey]);
  }
}

/**
    
box.put(userIdKey, user.id.toString());
box.put(emailKey, user.email.toString());
    
String? get userId => box.get(userIdKey);
String? get email => box.get(emailKey);
   
**/
