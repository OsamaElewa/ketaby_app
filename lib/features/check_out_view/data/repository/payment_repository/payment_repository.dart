
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../models/stripe_service_models/payment_intent_input_model.dart';

abstract class PaymentRepository{

Future<Either<Failure,void>> makePayment({
  required PaymentIntentInputModel paymentIntentInputModel});
}