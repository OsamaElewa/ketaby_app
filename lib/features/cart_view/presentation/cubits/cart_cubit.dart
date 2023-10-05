import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';

import '../../data/models/cart_model.dart';
import '../../data/repository/cart_repository.dart';
import 'cart_state.dart';


class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepository) : super(CartInitialState());

  final CartRepository cartRepository;


  static CartCubit get(context) => BlocProvider.of(context);

  CartModel? cartModel;

  Future<void> getCart() async {
    emit(CartLoadingState());
    Either<Failure, CartModel> result;
    result = await cartRepository.getCart();
    result.fold((failure) {
      print(failure.error);
      emit(CartFailureState(failure.error));
    }, (cartModel) {
      this.cartModel = cartModel;
      emit(CartSuccessState(cartModel));
    });
  }


  CartModel? removeCartModel;

  Future<void> removeFromCart({required String productId}) async {
    emit(RemoveCartLoadingState());
    Either<Failure, CartModel> result;
    result = await cartRepository.deleteFromCart(productId: productId);
    result.fold((failure) {
      print(failure.error);
      emit(RemoveCartFailureState(failure.error));
      getCart();
    }, (removeCartModel) {
      this.removeCartModel = removeCartModel;
      emit(RemoveCartSuccessState(removeCartModel));
      getCart();
    });
  }


  CartModel? updateCartModel;

  Future<void> updateFromCart({required String productId,required String quantity}) async {
    emit(UpdateCartLoadingState());
    Either<Failure, CartModel> result;
    result = await cartRepository.updateCart(productId: productId, quantity: quantity);
    result.fold((failure) {
      print(failure.error);
      emit(UpdateCartFailureState(failure.error));
      getCart();
    }, (updateCartModel) {
      this.updateCartModel = updateCartModel;
      emit(UpdateCartSuccessState(updateCartModel));
      getCart();
    });
  }
}
