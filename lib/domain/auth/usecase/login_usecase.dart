import 'package:dartz/dartz.dart';
import 'package:istanbulguidetwo/data/auth/models/user_login_req.dart';
import 'package:istanbulguidetwo/domain/auth/repository/auth_repository.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';

class LoginUseCase implements UseCase<Either, UserLoginReq>{
  @override
  Future<Either> call({UserLoginReq? params}) async{
    return sl<AuthRepository>().login(params!);
  }

}