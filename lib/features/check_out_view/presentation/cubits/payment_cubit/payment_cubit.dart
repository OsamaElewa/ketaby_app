
import 'dart:developer';


import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/features/check_out_view/presentation/cubits/payment_cubit/payment_state.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../data/models/stripe_service_models/payment_intent_input_model.dart';
import '../../../data/repository/payment_repository/payment_repository.dart';




class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.paymentRepository) : super(PaymentInitialState());

  final PaymentRepository paymentRepository;


  static PaymentCubit get(context) => BlocProvider.of(context);

  Future<void> makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoadingState());
    Either<Failure, void> result;
    result = await paymentRepository.makePayment(paymentIntentInputModel: paymentIntentInputModel);
    result.fold((failure) {
      print(failure.error.toString());
      print('/////////////////////////');
      print('/////////////////////////');
      print('/////////////////////////');
      emit(PaymentFailureState(failure.error.toString()));
    }, (r) {
      emit(PaymentSuccessState());
    });
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
