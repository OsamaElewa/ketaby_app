import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../data/models/book_model.dart';
import '../../data/repository/book_repository.dart';
import 'book_state.dart';


class BookCubit extends Cubit<BookState> {
  BookCubit(this.bookRepository) : super(BookInitialState());

  final BookRepository bookRepository;


  static BookCubit get(context) => BlocProvider.of(context);

  BookModel? bookModel;

  Future<void> getBook() async {
    emit(BookLoadingState());
    Either<Failure, BookModel> result;
    result = await bookRepository.getBook();
    result.fold((failure) {
      print(failure.error);
      emit(BookFailureState(failure.error));
    }, (bookModel) {
      this.bookModel = bookModel;
      emit(BookSuccessState(bookModel));
    });
  }
}
