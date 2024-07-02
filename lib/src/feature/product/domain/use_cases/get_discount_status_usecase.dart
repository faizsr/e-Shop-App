import 'package:ecommerce_app/src/feature/product/domain/repositories/remote_config_repository.dart';

class GetDiscountStatusUsecase {
  final RemoteConfigRepository remoteConfigRepository;

  GetDiscountStatusUsecase({required this.remoteConfigRepository});

  Future<bool> call() async => remoteConfigRepository.getDiscountStatus();
}
