import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../../models/order_model.dart';

abstract class OrderRepository {

  Future<Either<Failure, OrderModel>> placeOrder({
    required int id,
    required String name,
    required String email,
    required String phone,
    required String address}
      );
}
