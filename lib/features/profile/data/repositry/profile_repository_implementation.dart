import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/config/local/cache_helper.dart';
import 'package:ketaby/features/profile/data/repositry/profile_repository.dart';

import '../../../../core/api/api_services.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/app_constants.dart';
import '../model/profile_model.dart';


class ProfileRepositoryImplementation extends ProfileRepository {
  final ApiServices apiServices;

  ProfileRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, ProfileModel>> getUserProfile() async {
    try {
      Response data = await apiServices.get(
        endPoint: EndPoints.getUserProfile,
        token:AppConstants.token,
      );
      return Right(ProfileModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
