import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../data/models/add_to_cart_model.dart';
import '../../data/models/add_to_fav_model.dart';
import '../../data/repository/add_to_fav_repository.dart';
import 'add_to_state.dart';


class AddToCubit extends Cubit<AddToState> {
  AddToCubit(this.addToFavRepository) : super(AddToInitialState());

  final AddToFavRepository addToFavRepository;

  static AddToCubit get(context) => BlocProvider.of(context);

  AddToFavModel? addToFavModel;

  Future<void> addToFav({required String productId}) async {
    emit(AddToFavLoadingState());
    Either<Failure, AddToFavModel> result;
    result = await addToFavRepository.addToFav(productId: productId);
    result.fold((failure) {
      print(failure.error);
      emit(AddToFavFailureState(failure.error));
    }, (addToFavModel) {
      this.addToFavModel = addToFavModel;
      emit(AddToFavSuccessState(addToFavModel));
    });
  }


  AddToCartModel? addToCartModel;

  Future<void> addToCart({required String productId}) async {
    emit(AddToCartLoadingState());
    Either<Failure, AddToCartModel> result;
    result = await addToFavRepository.addToCart(productId: productId);
    result.fold((failure) {
      print(failure.error);
      emit(AddToCartFailureState(failure.error));
    }, (addToCartModel) {
      this.addToCartModel = addToCartModel;
      emit(AddToCartSuccessState(addToCartModel));
    });
  }
}
