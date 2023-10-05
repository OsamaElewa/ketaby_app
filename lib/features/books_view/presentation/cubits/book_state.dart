
import 'package:ketaby/features/books_view/data/models/book_model.dart';

import '../../data/models/add_to_cart_model.dart';
import '../../data/models/add_to_fav_model.dart';


abstract class BookState {}

class BookInitialState extends BookState {}

class BookLoadingState extends BookState {}

class BookSuccessState extends BookState {
  final BookModel bookModel;

 BookSuccessState(this.bookModel);
}

class BookFailureState extends BookState {
  final String error;

  BookFailureState(this.error);
}


class AddToFavLoadingState extends BookState {}

class AddToFavSuccessState extends BookState {
  final AddToFavModel addToFavModel;

  AddToFavSuccessState(this.addToFavModel);
}
class AddToFavFailureState extends BookState {
  final String error;

  AddToFavFailureState(this.error);
}


class AddToCartLoadingState extends BookState {}

class AddToCartSuccessState extends BookState {
  final AddToCartModel addToCartModel;

  AddToCartSuccessState(this.addToCartModel);
}

class AddToCartFailureState extends BookState {
  final String error;

  AddToCartFailureState(this.error);
}
