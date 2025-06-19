
import 'package:e_commerce_ui/core/utils/functions/cache_user.dart';
import 'package:e_commerce_ui/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:e_commerce_ui/features/authentication/data/data_sources/auth_local_data_source.dart';
import 'package:e_commerce_ui/features/authentication/domain/entities/user_entity.dart';
import 'package:e_commerce_ui/features/authentication/domain/repos/auth_repo.dart';
import 'package:flutter/material.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final CacheUser cacheUser;

  AuthRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
    this.cacheUser,
  );

  @override
  @override
Future<UserEntity> signIn({
  required String email,
  required String password,
}) async {
  final user = await localDataSource.signIn(email: email, password: password);

  if (user != null) {
    return UserEntity(id: user.uid, email: user.email!);
  } else {
    throw Exception("No account found for this email.");
  }
}

  @override
  Future<UserEntity> signUp({
    required String email,
    required String password,
  }) async {
    final user = await remoteDataSource.signUp(
      email: email,
      password: password,
    );
    if (user == null) {
      throw Exception('User not found');
    }
    return UserEntity(id: user.uid, email: user.email!);
  }

  @override
  Future<void> signOut() async {
    await remoteDataSource.signOut();
    cacheUser.clear();
  }
}
