abstract class AuthStatusDataSource {
  Future<bool> getUserStatus();
  Future<void> saveUserStatus(bool status);
}
