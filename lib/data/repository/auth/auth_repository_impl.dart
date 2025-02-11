import 'package:dart01/data/models/auth/create_user_req.dart';
import 'package:dart01/data/sources/auth/auth_firebase_service.dart';
import 'package:dart01/domain/repository/auth/auth.dart';
import 'package:dart01/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUserReq createUserReq) async {
    await sl<AuthFirebaseService>().signup(createUserReq);
  }
}
