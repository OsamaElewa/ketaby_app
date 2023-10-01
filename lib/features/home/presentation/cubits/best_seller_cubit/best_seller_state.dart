
import 'package:ketaby/features/books_view/data/models/book_model.dart';


abstract class BestSellerState {}

class BestSellerInitialState extends BestSellerState {}

class BestSellerLoadingState extends BestSellerState {}

class BestSellerSuccessState extends BestSellerState {
  final BookModel bestSellerModel;

  BestSellerSuccessState(this.bestSellerModel);
}

class BestSellerFailureState extends BestSellerState {
  final String error;

  BestSellerFailureState(this.error);
}
