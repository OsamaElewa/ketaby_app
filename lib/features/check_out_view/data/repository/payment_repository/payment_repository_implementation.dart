import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/features/check_out_view/data/repository/payment_repository/payment_repository.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/utils/stripe_services/stripe_service.dart';
import '../../models/stripe_service_models/payment_intent_input_model.dart';


class PaymentRepositoryImplementation extends PaymentRepository{
  final StripeService stripeService ;
  PaymentRepositoryImplementation(this.stripeService);
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async{
    try {
      await stripeService.makePayment(paymentIntentInputModel: paymentIntentInputModel);
      return const Right(null);

    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  }
