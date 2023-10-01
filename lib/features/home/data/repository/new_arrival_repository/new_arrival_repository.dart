import 'package:dartz/dartz.dart';
import 'package:ketaby/features/books_view/data/models/book_model.dart';
import '../../../../../core/errors/failures.dart';

abstract class  NewArrivalRepository {

  Future<Either<Failure, BookModel>> getNewArrival();
}
