abstract class AuthStatusRepository {
  Future<bool> getUserStatus();
  Future<void> saveUserStatus(bool status);
}
