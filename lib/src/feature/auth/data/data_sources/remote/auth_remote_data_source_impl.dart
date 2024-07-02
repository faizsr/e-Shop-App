import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/src/feature/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/src/feature/auth/data/models/user_model.dart';
import 'package:ecommerce_app/src/feature/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseFirestore fireStore;
  final FirebaseAuth auth;

  AuthRemoteDataSourceImpl({
    required this.fireStore,
    required this.auth,
  });

  @override
  Future<String> signUpUser(UserEntity user) async {
    // ========== Signing Up NewUser ==========
    try {
      final result = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      log('Sign Up Sucess: $result');
      // ========== Creating Collection ==========
      final userCollection = fireStore.collection('users');
      final uid = auth.currentUser?.uid ?? 'newuser';

      userCollection.doc(uid).get().then(
        (userDoc) {
          final newUser = UserModel(
            fullName: user.fullName,
            email: user.email,
          ).toMap();

          userCollection.doc(uid).set(newUser);
          log('User Added');
        },
      );
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  @override
  Future<String> signInUser(UserEntity user) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      log('Sign In Success: $result');
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  @override
  Future<void> signOutUser() async {
    await auth.signOut();
  }
}
