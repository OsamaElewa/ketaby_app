import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../models/book_model.dart';

abstract class BookRepository {

  Future<Either<Failure, BookModel>> getBook();
}
