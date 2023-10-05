import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/features/books_view/data/models/add_to_cart_model.dart';

import '../../../../../core/api/api_services.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../core/utils/app_constants.dart';
import '../models/add_to_fav_model.dart';
import '../models/book_model.dart';
import 'book_repository.dart';


class BookRepositoryImplementation extends BookRepository {
  final ApiServices apiServices;

  BookRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, BookModel>> getBook() async{
    try {
      Response data = await apiServices.get(
          endPoint: EndPoints.books);
      print(data.data);
      return Right(BookModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AddToFavModel>> addToFav({required String productId}) async{
    try {
      Response data = await apiServices.post(
          endPoint: EndPoints.addToFav,
          data: {
            'product_id' : productId
          },
          token: AppConstants.token
      );
      print(data.data);
      return Right(AddToFavModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AddToCartModel>> addToCart({required String productId}) async{
    try {
      Response data = await apiServices.post(
          endPoint: EndPoints.addToCart,
          data: {
            'product_id' : productId
          },
          token: AppConstants.token
      );
      print(data.data);
      return Right(AddToCartModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}