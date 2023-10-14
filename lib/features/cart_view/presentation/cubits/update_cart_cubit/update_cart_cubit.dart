import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/features/cart_view/presentation/cubits/update_cart_cubit/update_cart_state.dart';


import '../../../data/models/cart_model.dart';
import '../../../data/repository/cart_repository.dart';
import '../cart_state.dart';

class UpdateCartCubit extends Cubit<UpdateCartState> {
  UpdateCartCubit(this.cartRepository) : super(UpdateeCartInitialState());

  static UpdateCartCubit get(BuildContext context) => BlocProvider.of(context);

  final CartRepository cartRepository;

  Future<void> updateCart({
    required String bookId,
    required String quantity,
  }) async {
    emit(UpdateeCartLoadingState());
    Either<Failure, CartModel> result;
    result =
        await cartRepository.updateCart(quantity: quantity, productId: bookId);
    result.fold(
      (failure) {
        emit(UpdateeCartFailureState(failure.error));
      },
      (cartModel) {
        emit(UpdateeCartSuccessState());
      },
    );
  }
}
