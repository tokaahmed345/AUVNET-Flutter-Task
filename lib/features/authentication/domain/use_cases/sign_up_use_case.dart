import 'package:e_commerce_ui/features/authentication/domain/entities/user_entity.dart';
import 'package:e_commerce_ui/features/authentication/domain/repos/auth_repo.dart';


class SignUp {
  final AuthRepository authRepository;

  SignUp(this.authRepository);

  Future<UserEntity?> call({required String email, required String password}) {
    return authRepository.signUp(email: email, password: password);
  }
}