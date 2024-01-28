import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/core/functions/show_snack_bar.dart';
import 'package:ketaby/features/cart_view/presentation/cubits/remove_from_cart_cubit/remove_from_cart_state.dart';
import 'package:ketaby/features/favorite_view/data/repository/favorite_repository.dart';
import 'package:ketaby/features/favorite_view/presentation/cubits/remove_from_fav_state.dart';

import '../../../cart_view/data/repository/cart_repository.dart';

import '../../data/models/favorite_model.dart';

class RemoveFromFavCubit extends Cubit<RemoveFromFavState> {
  RemoveFromFavCubit(this.favoriteRepository)
      : super(RemoveFromFavInitialState());

  static RemoveFromFavCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final FavoriteRepository favoriteRepository;

  Future<void> removeFromFav({required int productId,required BuildContext context}) async {
    emit(RemoveFromFavLoadingState());
    Either<Failure, FavoriteModel> result;
    result = await favoriteRepository.removeFromFav(productId: productId);
    result.fold((failure) {
      print(failure.error);
      showErrorSnackBar(context: context, message: failure.error.toString());
      emit(RemoveFromFavFailureState(failure.error));
    }, (addToFavModel) {
      //this.addToFavModel = addToFavModel;
      //togglefav.remove(productId);
      showSuccessSnackBar(context: context, message: addToFavModel.message!);
      emit(RemoveFromFavSuccessState());
     // getFavorite();
    });
  }
}
