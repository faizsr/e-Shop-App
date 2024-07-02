import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await Firebase.initializeApp();

  // Provider Controller
  getIt.registerFactory<AuthController>(
    () => AuthController(
      signInUsecase: getIt.call(),
      signOutUsecase: getIt.call(),
      signUpUsecase: getIt.call(),
      userStatusUsecase: getIt.call(),
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

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDataSource: getIt.call()),
  );
  getIt.registerLazySingleton<AuthStatusRepository>(
    () => AuthStatusRepositoryImpl(authStatusDataSource: getIt.call()),
  );

  // Remote DataSource
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(fireStore: getIt.call(), auth: getIt.call()),
  );
  getIt.registerLazySingleton<AuthStatusDataSource>(
    () => AuthStatusDataSourceImpl(),
  );

  // External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  getIt.registerLazySingleton(() => auth);
  getIt.registerLazySingleton(() => fireStore);
}
