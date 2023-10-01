
import 'package:ketaby/features/books_view/data/models/book_model.dart';


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
