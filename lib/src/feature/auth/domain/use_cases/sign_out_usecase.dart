import 'package:ecommerce_app/src/feature/auth/domain/repositories/auth_repository.dart';

class SignOutUsecase {
  final AuthRepository authRepository;

  SignOutUsecase({required this.authRepository});

  Future<void> call() async {
    return await authRepository.signOut();
  }
}
