import 'package:dart01/data/models/auth/create_user_req.dart';
import 'package:dart01/data/models/auth/signin_user_req.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signinUserReq);
}
