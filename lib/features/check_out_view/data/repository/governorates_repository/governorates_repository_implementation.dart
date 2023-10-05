import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/features/check_out_view/data/models/governorates_model.dart';
import 'package:ketaby/features/favorite_view/data/models/favorite_model.dart';

import '../../../../../core/api/api_services.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/errors/failures.dart';
import 'governorates_repository.dart';


class GovernoratesRepositoryImplementation extends GovernoratesRepository {
  final ApiServices apiServices;
  GovernoratesRepositoryImplementation(this.apiServices);


  @override
  Future<Either<Failure, GovernoratesModel>> getGovernorates() async{
    try {
      Response data = await apiServices.get(
          endPoint: EndPoints.governorate,
          token: AppConstants.token
      );

      print(data.data);
      return Right(GovernoratesModel.fromJson(data.data));

    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}