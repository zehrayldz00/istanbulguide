import 'package:dartz/dartz.dart';
import 'package:istanbulguidetwo/data/popular/models/popular.dart';
import 'package:istanbulguidetwo/data/popular/source/populars_firebase_service.dart';

import '../../../domain/popular/repository/popular.dart';
import '../../../service_locator.dart';

class PopularRepositoryImpl extends PopularRepository {
  @override
  Future<Either> getPopulars() async {
    var populars = await sl<PopularsFirebaseService>().getPopulars();
    return populars.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data).map((e) => PopularModel.fromMap(e).toEntity()).toList()
        );
      },
    );
  }
}
