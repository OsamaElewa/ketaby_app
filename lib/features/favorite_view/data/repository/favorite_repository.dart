import 'package:dartz/dartz.dart';
import 'package:ketaby/features/favorite_view/data/models/favorite_model.dart';
import '../../../../../core/errors/failures.dart';

abstract class FavoriteRepository {

  Future<Either<Failure, FavoriteModel>> getFavorite();
  Future<Either<Failure, FavoriteModel>> removeFromFav({required int productId});
}

