import 'package:ecommerce_app/src/feature/auth/domain/entities/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<String> signUpUser(UserEntity user);
  Future<String> signInUser(UserEntity user);
  Future<void> signOutUser();
}
