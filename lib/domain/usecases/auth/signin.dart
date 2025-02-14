import 'package:dart01/core/usecase/usecase.dart';
import 'package:dart01/data/models/auth/signin_user_req.dart';
import 'package:dart01/domain/repository/auth/auth.dart';
import 'package:dart01/service_locator.dart';
import 'package:dartz/dartz.dart';

class SigninUseCase implements Usecase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    if (params == null) {
      return Left('Missing SigninUserReq parameters');
    }
    return sl<AuthRepository>().signin(params);
  }
}
