import '../../../data/models/order_model.dart';

abstract class OrderState {}

class OrderInitialState extends OrderState {}

class OrderLoadingState extends  OrderState {}
class OrderSuccessState extends  OrderState {
  final OrderModel orderModel;

 OrderSuccessState(this.orderModel);
}

class OrderFailureState extends OrderState {
  final String error;
  OrderFailureState(this.error);
}
