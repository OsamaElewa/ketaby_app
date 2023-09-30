import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../../models/new_arrival_model.dart';

abstract class  NewArrivalRepository {

  Future<Either<Failure, NewArrivalModel>> getNewArrival();
}
