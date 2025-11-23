import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istanbulguidetwo/common/bloc/populars/populars_display_state.dart';
import 'package:istanbulguidetwo/domain/popular/usecases/get_populars_usecase.dart';

import '../../../service_locator.dart';

class PopularsDisplayCubit extends Cubit<PopularsDisplayState> {
  PopularsDisplayCubit() : super(PopularsLoading());

  void displayPopulars() async {
    var returnedData = await sl<GetPopularsUseCase>().call();
    return returnedData.fold(
      (error) {
        emit(LoadPopularsFailure());
      },
      (data) {
        emit(PopularsLoaded(populars: data));
      },
    );
  }
}
