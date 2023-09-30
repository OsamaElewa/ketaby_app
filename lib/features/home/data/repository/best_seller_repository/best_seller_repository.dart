import 'package:dartz/dartz.dart';
import 'package:ketaby/features/home/data/models/best_seller_model.dart';

import '../../../../../core/errors/failures.dart';

abstract class BestSellerRepository {

  Future<Either<Failure, BestSellerModel>> getBestSeller();
}
