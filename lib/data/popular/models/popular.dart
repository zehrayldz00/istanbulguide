import 'package:istanbulguidetwo/domain/popular/entity/popular.dart';

class PopularModel {
  final String title;
  final String placeId;
  final String image;

  PopularModel({
    required this.title,
    required this.placeId,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'placeId': placeId,
      'image': image,
    };
  }

  factory PopularModel.fromMap(Map<String, dynamic> map) {
    return PopularModel(
      title: map['title'] as String,
      placeId: map['placeId'] as String,
      image: map['image'] as String,
    );
  }}

extension PopularXModel on PopularModel{
  PopularEntity toEntity() {
    return PopularEntity(
      title: title,
      placeId: placeId,
      image: image,);
  }
}