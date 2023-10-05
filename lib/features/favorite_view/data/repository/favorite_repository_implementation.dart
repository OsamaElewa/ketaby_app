import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/features/books_view/data/models/add_to_fav_model.dart';
import 'package:ketaby/features/favorite_view/data/models/favorite_model.dart';

import '../../../../../core/api/api_services.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../core/api/end_points.dart';
import 'favorite_repository.dart';


class FavoriteRepositoryImplementation extends FavoriteRepository {
  final ApiServices apiServices;
  FavoriteRepositoryImplementation(this.apiServices);


  @override
  Future<Either<Failure, FavoriteModel>> getFavorite() async{
    try {
      Response data = await apiServices.get(
          endPoint: EndPoints.favorites,
        token: AppConstants.token
      );

      print(data.data);
      return Right(FavoriteModel.fromJson(data.data));

    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, FavoriteModel>> removeFromFav({required int productId}) async{
    try {
      Response data = await apiServices.post(
        data: {
          'product_id' : productId.toString()
        },
          endPoint: EndPoints.remove_fav,
          token: AppConstants.token
      );

      print(data.data);
      return Right(FavoriteModel.fromJson(data.data));

    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}