import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../models/slider_model.dart';


abstract class SliderRepository {

  Future<Either<Failure, SliderModel>> getSlider();
}
