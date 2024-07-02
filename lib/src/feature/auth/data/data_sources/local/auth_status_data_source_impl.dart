import 'package:ecommerce_app/src/feature/auth/data/data_sources/local/auth_status_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthStatusDataSourceImpl extends AuthStatusDataSource {
  final SharedPreferences sharedPreferences;

  AuthStatusDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> getUserStatus() async {
    final bool? status = sharedPreferences.getBool('SIGNIN');
    return status ?? false;
  }

  @override
  Future<void> saveUserStatus(bool status) async {
    sharedPreferences.setBool('SIGNIN', status);
  }
}
