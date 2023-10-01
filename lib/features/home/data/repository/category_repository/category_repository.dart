import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../models/category_model.dart';

abstract class CategoryRepository {

  Future<Either<Failure, CategoryModel>> getCategories();
}
