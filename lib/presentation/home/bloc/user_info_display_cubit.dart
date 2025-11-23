import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istanbulguidetwo/domain/auth/usecase/get_user_usecase.dart';
import 'package:istanbulguidetwo/presentation/home/bloc/user_info_display_state.dart';

import '../../../service_locator.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState>{
  UserInfoDisplayCubit() : super(UserInfoLoading());

  void displayUserInfo() async{
    var returnedData = await sl<GetUserUseCase>().call();
    return returnedData.fold(
        (error){
          emit(LoadUserInfoFailure());
        },
        (data){
          emit(UserInfoLoaded(
            user: data
          ));
        }
    );
  }

}