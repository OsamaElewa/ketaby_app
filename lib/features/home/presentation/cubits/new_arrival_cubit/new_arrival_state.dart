

import 'package:ketaby/features/books_view/data/models/book_model.dart';


abstract class NewArrivalState {}

class NewArrivalInitialState extends NewArrivalState {}

class NewArrivalLoadingState extends NewArrivalState {}

class NewArrivalSuccessState extends NewArrivalState {
  final BookModel newArrivalModel;

NewArrivalSuccessState(this.newArrivalModel);
}

class NewArrivalFailureState extends NewArrivalState {
final String error;

NewArrivalFailureState(this.error);
}
