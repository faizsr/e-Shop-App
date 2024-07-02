import 'package:ecommerce_app/src/feature/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/src/feature/auth/domain/entities/user_entity.dart';
import 'package:ecommerce_app/src/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<String> signIn(UserEntity user) async =>
      await authRemoteDataSource.signInUser(user);

  @override
  Future<String> signUp(UserEntity user) async =>
      await authRemoteDataSource.signUpUser(user);

  @override
  Future<void> signOut() async => await authRemoteDataSource.signOutUser();
}
