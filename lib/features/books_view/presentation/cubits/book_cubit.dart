import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../data/models/add_to_cart_model.dart';
import '../../data/models/add_to_fav_model.dart';
import '../../data/models/book_model.dart';
import '../../data/repository/add_to_fav_repository.dart';
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


  AddToFavModel? addToFavModel;

  Future<void> addToFav({required String productId}) async {
    emit(AddToFavLoadingState());
    Either<Failure, AddToFavModel> result;
    result = await bookRepository.addToFav(productId: productId);
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
    result = await bookRepository.addToCart(productId: productId);
    result.fold((failure) {
      print(failure.error);
      emit(AddToCartFailureState(failure.error));
    }, (addToCartModel) {
      this.addToCartModel = addToCartModel;
      emit(AddToCartSuccessState(addToCartModel));
    });
  }
}
