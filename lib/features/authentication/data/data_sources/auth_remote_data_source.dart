import 'dart:developer';

import 'package:e_commerce_ui/core/utils/functions/cache_user.dart';
import 'package:e_commerce_ui/features/authentication/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final CacheUser cacheUser;

  AuthRemoteDataSource({required this.firebaseAuth, required this.cacheUser});

Future<User?> signUp({
  required String email,
  required String password,
}) async {
  try {
    final FirebaseAuth auth = FirebaseAuth.instance;

    // Check if email already exists
    List<String> signInMethods = await auth.fetchSignInMethodsForEmail(email);
    if (signInMethods.isNotEmpty) {
      throw Exception('This email is already registered.');
    }

    // Create user
    UserCredential response = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Save user locally
    cacheUser.saveUserData(
      UserEntity(
        id: response.user?.uid ?? '',
        email: response.user?.email ?? '',
      ),
    );

    log('User registered successfully and data saved locally.');
    return response.user;
  } catch (e) {
    log('Error during registration: $e');
    throw Exception(e.toString());
  }
}

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
