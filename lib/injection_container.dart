import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/src/feature/auth/data/data_sources/local/auth_status_data_source.dart';
import 'package:ecommerce_app/src/feature/auth/data/data_sources/local/auth_status_data_source_impl.dart';
import 'package:ecommerce_app/src/feature/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/src/feature/auth/data/data_sources/remote/auth_remote_data_source_impl.dart';
import 'package:ecommerce_app/src/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:ecommerce_app/src/feature/auth/data/repositories/auth_status_repository_impl.dart';
import 'package:ecommerce_app/src/feature/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce_app/src/feature/auth/domain/repositories/auth_status_repository.dart';
import 'package:ecommerce_app/src/feature/auth/domain/use_cases/sign_in_usecase.dart';
import 'package:ecommerce_app/src/feature/auth/domain/use_cases/sign_out_usecase.dart';
import 'package:ecommerce_app/src/feature/auth/domain/use_cases/sign_up_usecase.dart';
import 'package:ecommerce_app/src/feature/auth/domain/use_cases/user_status_usecase.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/controllers/auth_controller.dart';
import 'package:ecommerce_app/src/feature/product/data/data_sources/remote/product_remote_data_source.dart';
import 'package:ecommerce_app/src/feature/product/data/data_sources/remote/product_remote_data_source_impl.dart';
import 'package:ecommerce_app/src/feature/product/data/data_sources/services/remote_config_services.dart';
import 'package:ecommerce_app/src/feature/product/data/repositories/product_repository_impl.dart';
import 'package:ecommerce_app/src/feature/product/data/repositories/remote_config_repository_impl.dart';
import 'package:ecommerce_app/src/feature/product/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/src/feature/product/domain/repositories/remote_config_repository.dart';
import 'package:ecommerce_app/src/feature/product/domain/use_cases/fetch_all_products_usecase.dart';
import 'package:ecommerce_app/src/feature/product/domain/use_cases/get_discount_status_usecase.dart';
import 'package:ecommerce_app/src/feature/product/presentation/controllers/product_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await Firebase.initializeApp();

  // External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final sharedPreferences = await SharedPreferences.getInstance();
  final dio = Dio();

  // Initialize Remote Config
  final remoteConfig = FirebaseRemoteConfig.instance;

  getIt.registerLazySingleton(() => auth);
  getIt.registerLazySingleton(() => fireStore);
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => dio);
  getIt.registerLazySingleton(() => remoteConfig);

  // Provider Controller
  getIt.registerFactory<AuthController>(
    () => AuthController(
      signInUsecase: getIt.call(),
      signOutUsecase: getIt.call(),
      signUpUsecase: getIt.call(),
      userStatusUsecase: getIt.call(),
    ),
  );
  getIt.registerFactory<ProductController>(
    () => ProductController(
      fetchAllProductsUsecase: getIt.call(),
      getDiscountStatusUsecase: getIt.call(),
    ),
  );

  // Use Cases
  getIt.registerLazySingleton<SignInUsecase>(
    () => SignInUsecase(authRepository: getIt.call()),
  );
  getIt.registerLazySingleton<SignUpUsecase>(
    () => SignUpUsecase(authRepository: getIt.call()),
  );
  getIt.registerLazySingleton<SignOutUsecase>(
    () => SignOutUsecase(authRepository: getIt.call()),
  );
  getIt.registerLazySingleton<UserStatusUsecase>(
    () => UserStatusUsecase(authStatusRepository: getIt.call()),
  );
  getIt.registerLazySingleton<FetchAllProductsUsecase>(
    () => FetchAllProductsUsecase(productRepository: getIt.call()),
  );
  getIt.registerLazySingleton<GetDiscountStatusUsecase>(
    () => GetDiscountStatusUsecase(remoteConfigRepository: getIt.call()),
  );

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDataSource: getIt.call()),
  );
  getIt.registerLazySingleton<AuthStatusRepository>(
    () => AuthStatusRepositoryImpl(authStatusDataSource: getIt.call()),
  );
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(productRemoteDataSource: getIt.call()),
  );
  getIt.registerLazySingleton<RemoteConfigRepository>(
    () => RemoteConfigRepositoryImpl(remoteConfigService: getIt.call()),
  );

  // Remote DataSource
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(fireStore: getIt.call(), auth: getIt.call()),
  );
  getIt.registerLazySingleton<AuthStatusDataSource>(
    () => AuthStatusDataSourceImpl(sharedPreferences: getIt.call()),
  );
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(dio: getIt.call()),
  );

  // Sevices
  getIt.registerLazySingleton<RemoteConfigService>(
    () => RemoteConfigService(remoteConfig: getIt.call()),
  );
}
