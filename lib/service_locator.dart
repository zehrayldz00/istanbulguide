import 'package:get_it/get_it.dart';
import 'package:istanbulguidetwo/data/auth/repository/auth_repository_impl.dart';
import 'package:istanbulguidetwo/data/auth/source/auth_firebase_service.dart';
import 'package:istanbulguidetwo/domain/auth/repository/auth_repository.dart';
import 'package:istanbulguidetwo/domain/auth/usecase/is_logged_in_usecase.dart';
import 'package:istanbulguidetwo/domain/auth/usecase/login_usecase.dart';
import 'package:istanbulguidetwo/domain/auth/usecase/register_usecase.dart';
import 'package:istanbulguidetwo/domain/auth/usecase/reset_password_usecase.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // UseCases
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase());
  sl.registerSingleton<LoginUseCase>(LoginUseCase());
  sl.registerSingleton<ResetPasswordUseCase>(ResetPasswordUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());

}
