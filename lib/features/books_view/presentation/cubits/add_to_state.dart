
import 'package:ketaby/features/books_view/data/models/add_to_fav_model.dart';

import '../../data/models/add_to_cart_model.dart';


abstract class AddToState {}

class AddToInitialState extends AddToState {}

class AddToFavLoadingState extends AddToState {}

class AddToFavSuccessState extends AddToState {
  final AddToFavModel addToFavModel;

  AddToFavSuccessState(this.addToFavModel);
}

class AddToFavFailureState extends AddToState {
  final String error;

  AddToFavFailureState(this.error);
}



class AddToCartLoadingState extends AddToState {}

class AddToCartSuccessState extends AddToState {
  final AddToCartModel addToCartModel;

  AddToCartSuccessState(this.addToCartModel);
}

class AddToCartFailureState extends AddToState {
  final String error;

  AddToCartFailureState(this.error);
}
