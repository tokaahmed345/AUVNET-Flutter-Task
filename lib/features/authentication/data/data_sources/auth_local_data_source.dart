import 'dart:developer';

import 'package:e_commerce_ui/core/utils/functions/cache_user.dart';
import 'package:e_commerce_ui/features/authentication/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthLocalDataSource {
  final CacheUser cacheUser;

  AuthLocalDataSource({required this.cacheUser});

  Future<User?> signIn({required String email, required String password}) async {
    try {
    
     

        final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        cacheUser.saveUserData(
          UserEntity(id: response.user!.uid, email: response.user!.email!),
        );

        return response.user;
      
    } catch (e) {
      log('Sign in failed: $e');
   //   throw Exception(e.toString());
    }
  }
}
