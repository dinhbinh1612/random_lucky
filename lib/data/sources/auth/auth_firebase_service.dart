import 'package:dart01/data/models/auth/create_user_req.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<void> signin();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<void> signin() {
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    if (createUserReq.email.trim().isEmpty || createUserReq.password.isEmpty) {
      return Left('Warning 202: Email and password cannot be empty.');
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
      return Left('Warning 200: $message');
    } catch (e) {
      return Left('Warning 201: Unexpected error - ${e.toString()}');
    }
  }
}
