class UserEntity {
  final String fullName;
  final String email;
  final String password;

  UserEntity({
    this.fullName = '',
    required this.email,
    this.password = '',
  });
}
