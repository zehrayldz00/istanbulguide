import 'package:dartz/dartz.dart';
import 'package:istanbulguidetwo/core/usecase/usecase.dart';
import 'package:istanbulguidetwo/domain/auth/repository/auth_repository.dart';

import '../../../service_locator.dart';

class ResetPasswordUseCase implements UseCase<Either,String> {
  @override
  Future<Either> call({String? params}) async{
    return sl<AuthRepository>().resetPassword(params!);
  }

}