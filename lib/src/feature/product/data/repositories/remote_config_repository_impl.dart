import 'package:ecommerce_app/src/feature/product/data/data_sources/services/remote_config_services.dart';
import 'package:ecommerce_app/src/feature/product/domain/repositories/remote_config_repository.dart';

class RemoteConfigRepositoryImpl extends RemoteConfigRepository {
  final RemoteConfigService remoteConfigService;

  RemoteConfigRepositoryImpl({required this.remoteConfigService});

  @override
  Future<bool> getDiscountStatus() async {
    await remoteConfigService.remoteConfig.fetchAndActivate();
    return remoteConfigService.discountStatus;
  }
}
