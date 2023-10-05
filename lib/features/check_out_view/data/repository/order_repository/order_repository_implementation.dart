import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/features/check_out_view/data/models/governorates_model.dart';
import 'package:ketaby/features/check_out_view/data/models/order_model.dart';
import 'package:ketaby/features/favorite_view/data/models/favorite_model.dart';

import '../../../../../core/api/api_services.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/errors/failures.dart';
import 'order_repository.dart';


class OrderRepositoryImplementation extends OrderRepository {
  final ApiServices apiServices;
  OrderRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, OrderModel>> placeOrder({
    required int id,
    required String name,
    required String email,
    required String phone,
    required String address
  })
  async{
    try {
      Response data = await apiServices.post(
          data: {
            'governorate_id' : id.toString(),
            'name' : name,
            'phone' : phone,
            'address' : address,
            'email' : email
          },
          endPoint: EndPoints.place_order,
          token: AppConstants.token
      );

      print(data.data);
      return Right(OrderModel.fromJson(data.data));

    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }


}