import 'package:dartz/dartz.dart';
import 'package:ketaby/features/home/data/models/best_seller_model.dart';

import '../../../../../core/errors/failures.dart';
import '../../models/category_model.dart';

abstract class CategoryRepository {

  Future<Either<Failure, CategoryModel>> getCategories();
}
