import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../../models/governorates_model.dart';

abstract class GovernoratesRepository {

  Future<Either<Failure, GovernoratesModel>> getGovernorates();
}
