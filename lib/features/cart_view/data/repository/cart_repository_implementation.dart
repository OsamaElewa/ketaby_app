import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/core/utils/app_constants.dart';

import '../../../../../core/api/api_services.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../core/api/end_points.dart';
import '../models/cart_model.dart';
import 'cart_repository.dart';


class CartRepositoryImplementation extends CartRepository {
  final ApiServices apiServices;
  CartRepositoryImplementation(this.apiServices);


  @override
  Future<Either<Failure, CartModel>> getCart() async{
    try {
      Response data = await apiServices.get(
          endPoint: EndPoints.cart,
        token: AppConstants.token
      );

      print(data.data);
      return Right(CartModel.fromJson(data.data));

    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CartModel>> deleteFromCart({required String productId}) async{
    try {
      Response data = await apiServices.post(
        data: {
          'cart_item_id' : productId
        },
          endPoint: EndPoints.remove_cart,
          token: AppConstants.token
      );

      print(data.data);
      return Right(CartModel.fromJson(data.data));

    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CartModel>> updateCart({required String productId,required String quantity}) async{
    try {
      Response data = await apiServices.post(
          data: {
            'cart_item_id' : productId,
            'quantity' : quantity
          },
          endPoint: EndPoints.update_cart,
          token: AppConstants.token
      );

      print(data.data);
      return Right(CartModel.fromJson(data.data));

    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}