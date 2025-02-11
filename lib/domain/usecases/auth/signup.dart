import 'package:dartz/dartz.dart';
import 'package:dart01/core/usecase/usecase.dart';
import 'package:dart01/data/models/auth/create_user_req.dart';

class SignupUseCase implements Usecase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
