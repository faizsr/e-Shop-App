import 'package:ecommerce_app/src/feature/auth/domain/entities/user_entity.dart';
import 'package:ecommerce_app/src/feature/auth/domain/repositories/auth_repository.dart';

class SignUpUsecase {
  final AuthRepository authRepository;

  SignUpUsecase({required this.authRepository});

  Future<String> call(UserEntity user) async {
    return await authRepository.signUp(user);
  }
}
