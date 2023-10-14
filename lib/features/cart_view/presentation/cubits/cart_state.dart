import '../../data/models/cart_model.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {
  final CartModel cartModel;

 CartSuccessState(this.cartModel);
}

class CartFailureState extends CartState {
  final String error;

  CartFailureState(this.error);
}
