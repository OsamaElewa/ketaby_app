abstract class PaymentState {}

class PaymentInitialState extends PaymentState {}

class PaymentLoadingState extends PaymentState {}

class PaymentSuccessState extends PaymentState {
  PaymentSuccessState();
}

class PaymentFailureState extends PaymentState {
  final String error;

  PaymentFailureState(this.error);
}
