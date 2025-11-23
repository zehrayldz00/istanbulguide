import 'package:dartz/dartz.dart';
import 'package:istanbulguidetwo/domain/popular/repository/popular.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';

class GetPopularsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<PopularRepository>().getPopulars();
  }
}
