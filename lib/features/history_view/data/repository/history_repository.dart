import 'package:dartz/dartz.dart';
import 'package:ketaby/features/history_view/data/models/history_model.dart';
import '../../../../../core/errors/failures.dart';

abstract class HistoryRepository {

  Future<Either<Failure, HistoryModel>> getHistory();
}
