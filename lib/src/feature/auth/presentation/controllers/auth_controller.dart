import 'dart:developer';

import 'package:ecommerce_app/src/feature/auth/domain/entities/user_entity.dart';
import 'package:ecommerce_app/src/feature/auth/domain/use_cases/sign_in_usecase.dart';
import 'package:ecommerce_app/src/feature/auth/domain/use_cases/sign_out_usecase.dart';
import 'package:ecommerce_app/src/feature/auth/domain/use_cases/sign_up_usecase.dart';
import 'package:ecommerce_app/src/feature/auth/domain/use_cases/user_status_usecase.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  final SignInUsecase signInUsecase;
  final SignUpUsecase signUpUsecase;
  final SignOutUsecase signOutUsecase;
  final UserStatusUsecase userStatusUsecase;

  AuthController({
    required this.signInUsecase,
    required this.signOutUsecase,
    required this.signUpUsecase,
    required this.userStatusUsecase,
  });

  bool isLoading = false;
  String result = '';
  bool isObscure = true;

  Future<void> signUp(UserEntity user) async {
    isLoading = true;
    notifyListeners();

    final response = await signUpUsecase.call(user);
    result = response;
    notifyListeners();
    log('Result from signing up from controller: $result');
    await userStatusUsecase.save(true);

    isLoading = false;
    notifyListeners();
  }

  Future<void> signIn(UserEntity user) async {
    isLoading = true;
    notifyListeners();

    final response = await signInUsecase.call(user);
    result = response;
    notifyListeners();
    log('Result from signing in from controller: $result');
    await userStatusUsecase.save(true);

    isLoading = false;
    notifyListeners();
  }

  Future<void> signOut() async {
    await signOutUsecase.call();
    await userStatusUsecase.save(false);
    notifyListeners();
  }

  void togglePassword() {
    isObscure = !isObscure;
    notifyListeners();
  }

  void resetToggle() {
    isObscure = true;
    notifyListeners();
  }
}
