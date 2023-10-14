import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/core/functions/show_snack_bar.dart';
import 'package:ketaby/features/cart_view/presentation/cubits/remove_from_cart_cubit/remove_from_cart_state.dart';

import '../../../data/models/cart_model.dart';
import '../../../data/repository/cart_repository.dart';

class RemoveFromCartCubit extends Cubit<RemoveFromCartState> {
  RemoveFromCartCubit(this.cartRepository)
      : super(RemoveFromCartInitialState());

  static RemoveFromCartCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final CartRepository cartRepository;

  Future<void> removeFromCart(
      {required String bookId, required BuildContext context}) async {
    emit(RemoveFromCartLoadingState());
    Either<Failure, CartModel> result;
    result = await cartRepository.deleteFromCart(productId: bookId);
    result.fold(
      (failure) {
        showErrorSnackBar(context: context, message: failure.error);
        emit(RemoveFromCartFailureState(failure.error));
      },
      (cartModel) {
        showSuccessSnackBar(context: context, message: cartModel.message!);
        emit(RemoveFromCartSuccessState());
      },
    );
  }
}
