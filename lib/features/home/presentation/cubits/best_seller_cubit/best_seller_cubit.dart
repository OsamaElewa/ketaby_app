import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/features/books_view/data/models/book_model.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/repository/best_seller_repository/best_seller_repository.dart';
import 'best_seller_state.dart';


class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this.bestSellerRepository) : super(BestSellerInitialState());

  final BestSellerRepository bestSellerRepository;


  static BestSellerCubit get(context) => BlocProvider.of(context);

  BookModel? bestSellerModel;

  Future<void> getBestSeller() async {
    emit(BestSellerLoadingState());
    Either<Failure, BookModel> result;
    result = await bestSellerRepository.getBestSeller();
    result.fold((failure) {
      emit(BestSellerFailureState(failure.error));
    }, (bestSellerModel) {
      this.bestSellerModel = bestSellerModel;
      emit(BestSellerSuccessState(bestSellerModel));
    });
  }
}
