import 'package:dartz/dartz.dart';
import 'package:ketaby/features/books_view/data/models/book_model.dart';

import '../../../../../core/errors/failures.dart';

abstract class BestSellerRepository {

  Future<Either<Failure, BookModel>> getBestSeller();
}
