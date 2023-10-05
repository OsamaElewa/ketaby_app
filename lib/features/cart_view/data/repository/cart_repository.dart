import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../models/cart_model.dart';

abstract class CartRepository {

  Future<Either<Failure, CartModel>> getCart();
  Future<Either<Failure, CartModel>> deleteFromCart({required String productId});
  Future<Either<Failure, CartModel>> updateCart({required String productId,required String quantity});
}
