import 'package:istanbulguidetwo/data/auth/models/user_creation_req.dart';
import 'package:dartz/dartz.dart';
import 'package:istanbulguidetwo/data/auth/models/user_login_req.dart';

abstract class AuthRepository{
  Future<Either> register(UserCreationReq user);
  Future<Either> login(UserLoginReq user);
}