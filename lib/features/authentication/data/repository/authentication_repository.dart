import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/authentication_model/authentication_model.dart';


abstract class AuthenticationRepository {
  Future<Either<Failure, AuthenticationModel>> userRegister({
    required String email,
    required String password,
    required String confirmPassword,
    required String name,
  });
  Future<Either<Failure, AuthenticationModel>> userLogin({
    required String email,
    required String password,
  });
}
