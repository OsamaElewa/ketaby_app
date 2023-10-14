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
}
