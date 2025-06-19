
import 'package:e_commerce_ui/features/authentication/domain/entities/user_entity.dart';
import 'package:e_commerce_ui/features/authentication/domain/repos/auth_repo.dart';

class SignIn {
  final AuthRepository authRepository;

  SignIn(this.authRepository);

  Future<UserEntity?> call({required String email, required String password}) {
    return authRepository.signIn(email: email, password: password);
  }
}