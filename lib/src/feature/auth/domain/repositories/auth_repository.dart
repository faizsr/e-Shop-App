import 'package:ecommerce_app/src/feature/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<String> signUp(UserEntity user);
  Future<String> signIn(UserEntity user);
  Future<void> signOut();
}
