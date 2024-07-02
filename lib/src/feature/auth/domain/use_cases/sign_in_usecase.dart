import 'package:ecommerce_app/src/feature/auth/domain/entities/user_entity.dart';
import 'package:ecommerce_app/src/feature/auth/domain/repositories/auth_repository.dart';

class SignInUsecase {
  final AuthRepository authRepository;

  SignInUsecase({required this.authRepository});

  Future<String> call(UserEntity user) async {
    return await authRepository.signIn(user);
  }
}
