import 'package:ecommerce_app/src/feature/auth/data/data_sources/local/auth_status_data_source.dart';
import 'package:ecommerce_app/src/feature/auth/domain/repositories/auth_status_repository.dart';

class AuthStatusRepositoryImpl implements AuthStatusRepository {
  final AuthStatusDataSource authStatusDataSource;

  AuthStatusRepositoryImpl({required this.authStatusDataSource});

  @override
  Future<bool> getUserStatus() async =>
      await authStatusDataSource.getUserStatus();

  @override
  Future<void> saveUserStatus(bool status) async =>
      await authStatusDataSource.saveUserStatus(status);
}
