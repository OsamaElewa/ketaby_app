import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/features/home/data/models/category_model.dart';
import 'package:ketaby/features/home/data/models/new_arrival_model.dart';

import '../../../../../core/api/api_services.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/errors/failures.dart';
import '../best_seller_repository/best_seller_repository.dart';
import 'new_arrival_repository.dart';


class NewArrivalRepositoryImplementation extends NewArrivalRepository {
  final ApiServices apiServices;

  NewArrivalRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, NewArrivalModel>> getNewArrival() async{
    try {
      Response data = await apiServices.get(
          endPoint: EndPoints.newarrival);
      return Right(NewArrivalModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
