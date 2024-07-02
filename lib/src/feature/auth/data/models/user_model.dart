import 'package:ecommerce_app/src/feature/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.fullName,
    required super.email,
    super.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullname': fullName,
      'email': email,
      'password': password,
    };
  }
}
