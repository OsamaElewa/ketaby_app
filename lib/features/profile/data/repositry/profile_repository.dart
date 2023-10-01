import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../model/profile_model.dart';


abstract class ProfileRepository {
  Future<Either<Failure, ProfileModel>> getUserProfile();
}
