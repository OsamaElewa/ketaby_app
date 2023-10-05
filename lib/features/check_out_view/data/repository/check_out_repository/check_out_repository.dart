import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../../models/check_out_model.dart';
import '../../models/governorates_model.dart';

abstract class CheckOutRepository {

  Future<Either<Failure, CheckOutModel>> getCheckOut();
}
