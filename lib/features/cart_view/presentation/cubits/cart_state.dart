



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



class RemoveCartLoadingState extends CartState {}

class RemoveCartSuccessState extends CartState {
  final CartModel removeCartModel;

  RemoveCartSuccessState(this.removeCartModel);
}

class RemoveCartFailureState extends CartState {
  final String error;

  RemoveCartFailureState(this.error);
}


class UpdateCartLoadingState extends CartState {}

class UpdateCartSuccessState extends CartState {
  final CartModel updateCartModel;

  UpdateCartSuccessState(this.updateCartModel);
}

class UpdateCartFailureState extends CartState {
  final String error;

  UpdateCartFailureState(this.error);
}
