import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../models/add_to_cart_model.dart';
import '../models/add_to_fav_model.dart';

abstract class AddToFavRepository {

  Future<Either<Failure, AddToFavModel>> addToFav({required String productId});

  Future<Either<Failure, AddToCartModel>> addToCart({required String productId});
}
