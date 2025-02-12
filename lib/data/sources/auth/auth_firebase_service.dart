import 'package:dart01/data/models/auth/create_user_req.dart';
import 'package:dart01/data/models/auth/signin_user_req.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    if (signinUserReq.email.isEmpty || signinUserReq.password.isEmpty) {
      debugPrint("warning: 202");
      return Left('Email and password cannot be empty.');
    }
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUserReq.email, password: signinUserReq.password);
      return Right('Lucky 100: Signin successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'The email address is invalid';
      } else if (e.code == 'user-not-found') {
        message = 'The email address does not exist';
      } else if (e.code == 'wrong-password') {
        message = 'The password is invalid';
      } else if (e.code == 'invalid-credential') {
        message = 'Account does not exist';
      } else {
        message = e.message ?? 'An unknown error occurred';
      }
      debugPrint('warning: 200 - $message');
      return Left(message);
    } catch (e) {
      debugPrint('error 401: ${e.toString()}');
      return Left('Unexpected error - ${e.toString()}');
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    if (createUserReq.fullName.isEmpty ||
        createUserReq.email.isEmpty ||
        createUserReq.password.isEmpty) {
      debugPrint("warning: 201");
      return Left('Email and password cannot be empty.');
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
      return Right('Lucky 100: Signup successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email';
      } else if (e.code == 'invalid-password') {
        message = 'The password provided is invalid';
      } else {
        message = e.message ?? 'An unknown error occurred';
      }
      debugPrint('warning: 203 - $message');
      return Left(message);
    } catch (e) {
      debugPrint('error 400: ${e.toString()}');
      return Left('Unexpected error - ${e.toString()}');
    }
  }
}
