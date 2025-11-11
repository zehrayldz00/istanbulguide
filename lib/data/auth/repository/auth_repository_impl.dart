import 'package:dartz/dartz.dart';
import 'package:istanbulguidetwo/data/auth/models/user_login_req.dart';
import 'package:istanbulguidetwo/domain/auth/repository/auth_repository.dart';

import '../../../service_locator.dart';
import '../models/user_creation_req.dart';
import '../source/auth_firebase_service.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> register(UserCreationReq user) async {
    return sl<AuthFirebaseService>().register(user);
  }

  @override
  Future<Either> login(UserLoginReq user) async {
    return await sl<AuthFirebaseService>().login(user);
  }

  @override
  Future<Either> resetPassword(String email) async{
    return await sl<AuthFirebaseService>().resetPassword(email);
  }

  @override
  Future<bool> isLoggedIn() async{
    return await sl<AuthFirebaseService>().isLoggedIn();
  }
}
