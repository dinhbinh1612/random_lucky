import 'package:dart01/domain/repository/auth/auth.dart';
import 'package:dart01/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dart01/core/usecase/usecase.dart';
import 'package:dart01/data/models/auth/create_user_req.dart';

class SignupUseCase implements Usecase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    if (params == null) {
      return Left('Missing required parameters');
    }
    return sl<AuthRepository>().signup(params);
  }
}
