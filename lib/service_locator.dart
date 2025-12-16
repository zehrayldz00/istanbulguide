import 'package:get_it/get_it.dart';
import 'package:istanbulguidetwo/data/auth/repository/auth_repository_impl.dart';
import 'package:istanbulguidetwo/data/auth/source/auth_firebase_service.dart';
import 'package:istanbulguidetwo/domain/auth/repository/auth_repository.dart';
import 'package:istanbulguidetwo/domain/auth/usecase/get_user_usecase.dart';
import 'package:istanbulguidetwo/domain/auth/usecase/is_logged_in_usecase.dart';
import 'package:istanbulguidetwo/domain/auth/usecase/login_usecase.dart';
import 'package:istanbulguidetwo/domain/auth/usecase/register_usecase.dart';
import 'package:istanbulguidetwo/domain/auth/usecase/reset_password_usecase.dart';
import 'package:istanbulguidetwo/domain/popular/usecases/get_populars_usecase.dart';
import 'package:istanbulguidetwo/presentation/features/guide/bloc/guide_cubit.dart';

import 'data/features/guide/repository/guide_repository_impl.dart';
import 'data/features/guide/source/guide_remote_data_source.dart';
import 'data/popular/repository/popular_repository_impl.dart';
import 'data/popular/source/populars_firebase_service.dart';
import 'domain/features/guide/repository/guide_repository.dart';
import 'domain/features/guide/usecase/send_message_usecase.dart';
import 'domain/popular/repository/popular.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<PopularsFirebaseService>(PopularsFirebaseServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<PopularRepository>(PopularRepositoryImpl());

  // UseCases
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase());
  sl.registerSingleton<LoginUseCase>(LoginUseCase());
  sl.registerSingleton<ResetPasswordUseCase>(ResetPasswordUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<GetPopularsUseCase>(GetPopularsUseCase());

  // 1. Data Source (En alttaki katman)
  sl.registerLazySingleton<GuideRemoteDataSource>(
        () => GuideRemoteDataSourceImpl(),
  );

  // 2. Repository (Data Source'a ihtiyaç duyar) -> HATANIN SEBEBİ BU SATIRIN EKSİKLİĞİ
  sl.registerLazySingleton<GuideRepository>(
        () => GuideRepositoryImpl(remoteDataSource: sl()),
  );

  // 3. UseCase (Repository'ye ihtiyaç duyar)
  sl.registerLazySingleton<SendMessageUseCase>(
        () => SendMessageUseCase(sl()),
  );

  // 4. Cubit (UseCase'e ihtiyaç duyar) - Factory olmalı!
  sl.registerFactory<GuideCubit>(
        () => GuideCubit(sendMessageUseCase: sl()),
  );
}
