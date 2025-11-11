import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istanbulguidetwo/domain/auth/usecase/is_logged_in_usecase.dart';
import 'package:istanbulguidetwo/presentation/splash/bloc/splash_state.dart';

import '../../../service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 4));
    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
