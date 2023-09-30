import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/features/home/data/models/slider_model.dart';
import 'package:ketaby/features/home/data/repository/slider_repository/slider_repository.dart';


import '../../../../../core/api/api_services.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/errors/failures.dart';


class SliderRepositoryImplementation extends SliderRepository {
  final ApiServices apiServices;

  SliderRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, SliderModel>> getSlider() async{
    try {
      Response data = await apiServices.get(
          endPoint: EndPoints.slider);
      return Right(SliderModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
