import 'package:istanbulguidetwo/domain/popular/entity/popular.dart';

abstract class PopularsDisplayState {}

class PopularsLoading extends PopularsDisplayState {}

class PopularsLoaded extends PopularsDisplayState {
  final List<PopularEntity> populars;

  PopularsLoaded({required this.populars});
}

class LoadPopularsFailure extends PopularsDisplayState {

}
