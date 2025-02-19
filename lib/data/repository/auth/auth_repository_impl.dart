import 'package:dart01/data/models/auth/create_user_req.dart';
import 'package:dart01/data/models/auth/signin_user_req.dart';
import 'package:dart01/data/sources/auth/auth_firebase_service.dart';
import 'package:dart01/domain/repository/auth/auth.dart';
import 'package:dart01/service_locator.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }
}
