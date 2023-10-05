import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/features/check_out_view/data/models/check_out_model.dart';
import 'package:ketaby/features/check_out_view/data/models/governorates_model.dart';

import '../../../../../core/api/api_services.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/errors/failures.dart';
import 'check_out_repository.dart';


class CheckOutRepositoryImplementation extends CheckOutRepository {
  final ApiServices apiServices;
  CheckOutRepositoryImplementation(this.apiServices);


  @override
  Future<Either<Failure, CheckOutModel>> getCheckOut() async{
    try {
      Response data = await apiServices.get(
          endPoint: EndPoints.checkout,
          token: AppConstants.token
      );

      print(data.data);
      return Right(CheckOutModel.fromJson(data.data));

    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}