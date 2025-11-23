import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class PopularsFirebaseService {
  Future<Either> getPopulars();
}

class PopularsFirebaseServiceImpl extends PopularsFirebaseService {
  @override
  Future<Either> getPopulars() async {
    try {
      var populars = await FirebaseFirestore.instance
          .collection('MostPopulars')
          .get();
      return Right(populars.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
