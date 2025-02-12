import 'package:dart01/data/repository/auth/auth_repository_impl.dart';
import 'package:dart01/data/sources/auth/auth_firebase_service.dart';
import 'package:dart01/domain/repository/auth/auth.dart';
import 'package:dart01/domain/usecases/auth/signin.dart';
import 'package:dart01/domain/usecases/auth/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> initalizeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}
