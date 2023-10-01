import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/features/books_view/data/models/book_model.dart';

import '../../../../../core/errors/failures.dart';

import '../../../data/repository/new_arrival_repository/new_arrival_repository.dart';
import 'new_arrival_state.dart';


class NewArrivalCubit extends Cubit<NewArrivalState> {
  NewArrivalCubit(this.newArrivalRepository) : super(NewArrivalInitialState());

  final NewArrivalRepository newArrivalRepository;


  static NewArrivalCubit get(context) => BlocProvider.of(context);

  BookModel? newArrivalModel;

  Future<void> getNewArrival() async {
    emit(NewArrivalLoadingState());
    Either<Failure, BookModel> result;
    result = await newArrivalRepository.getNewArrival();
    result.fold((failure) {
      emit(NewArrivalFailureState(failure.error));
    }, (newArrivalModel) {
      this.newArrivalModel = newArrivalModel;
      emit(NewArrivalSuccessState(newArrivalModel));
    });
  }
}
