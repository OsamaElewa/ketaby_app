import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/api/api_services.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/errors/failures.dart';
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
}