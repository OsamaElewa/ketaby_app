import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/core/utils/app_constants.dart';

import '../../../../../core/api/api_services.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../core/api/end_points.dart';
import '../models/history_model.dart';
import 'history_repository.dart';



class HistoryRepositoryImplementation extends HistoryRepository {
  final ApiServices apiServices;
  HistoryRepositoryImplementation(this.apiServices);


  @override
  Future<Either<Failure, HistoryModel>> getHistory() async{
    try {
      Response data = await apiServices.get(
          endPoint: EndPoints.history,
          token: AppConstants.token
      );

      print(data.data);
      return Right(HistoryModel.fromJson(data.data));

    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}