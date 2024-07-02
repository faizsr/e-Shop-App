import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig remoteConfig;

  RemoteConfigService({required this.remoteConfig});

  bool get discountStatus => remoteConfig.getBool('discount_status');
}
