import 'package:ecommerce_app/src/feature/auth/data/data_sources/local/auth_status_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthStatusDataSourceImpl extends AuthStatusDataSource {
  @override
  Future<bool> getUserStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final bool? status = preferences.getBool('SIGNIN');
    return status ?? false;
  }

  @override
  Future<void> saveUserStatus(bool status) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('SIGNIN', status);
  }
}
