import 'package:dartz/dartz.dart';

abstract class PopularRepository{
  Future<Either> getPopulars();
}