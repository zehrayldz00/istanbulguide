import 'package:dartz/dartz.dart';
import 'package:istanbulguidetwo/core/usecase/usecase.dart';
import 'package:istanbulguidetwo/data/auth/models/user_creation_req.dart';
import 'package:istanbulguidetwo/domain/auth/repository/auth_repository.dart';

import '../../../service_locator.dart';

class RegisterUseCase implements UseCase<Either, UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq? params}) async {
    return await sl<AuthRepository>().register(params!);
  }
}
