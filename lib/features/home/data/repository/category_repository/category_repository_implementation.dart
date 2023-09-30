import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/features/home/data/models/best_seller_model.dart';
import 'package:ketaby/features/home/data/models/category_model.dart';

import '../../../../../core/api/api_services.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/errors/failures.dart';
import '../best_seller_repository/best_seller_repository.dart';
import 'category_repository.dart';


class CategoryRepositoryImplementation extends CategoryRepository {
  final ApiServices apiServices;

  CategoryRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, CategoryModel>> getCategories() async{
    try {
      Response data = await apiServices.get(
          endPoint: EndPoints.category);
      return Right(CategoryModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
