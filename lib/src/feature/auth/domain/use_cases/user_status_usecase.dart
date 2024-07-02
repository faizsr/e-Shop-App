import 'package:ecommerce_app/src/feature/auth/domain/repositories/auth_status_repository.dart';

class UserStatusUsecase {
  final AuthStatusRepository authStatusRepository;

  UserStatusUsecase({required this.authStatusRepository});

  Future<bool> get() async {
    return await authStatusRepository.getUserStatus();
  }

  Future<void> save(bool status) async {
    await authStatusRepository.saveUserStatus(status);
  }
}
