import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/features/home/presentation/cubits/slider_cubit/slider_state.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/category_model.dart';
import '../../../data/models/new_arrival_model.dart';
import '../../../data/models/slider_model.dart';
import '../../../data/repository/category_repository/category_repository.dart';
import '../../../data/repository/new_arrival_repository/new_arrival_repository.dart';
import '../../../data/repository/slider_repository/slider_repository.dart';
import 'new_arrival_state.dart';


class NewArrivalCubit extends Cubit<NewArrivalState> {
  NewArrivalCubit(this.newArrivalRepository) : super(NewArrivalInitialState());

  final NewArrivalRepository newArrivalRepository;


  static NewArrivalCubit get(context) => BlocProvider.of(context);

  NewArrivalModel? newArrivalModel;

  Future<void> getNewArrival() async {
    emit(NewArrivalLoadingState());
    Either<Failure, NewArrivalModel> result;
    result = await newArrivalRepository.getNewArrival();
    result.fold((failure) {
      emit(NewArrivalFailureState(failure.error));
    }, (newArrivalModel) {
      this.newArrivalModel = newArrivalModel;
      emit(NewArrivalSuccessState(newArrivalModel));
    });
  }
}
