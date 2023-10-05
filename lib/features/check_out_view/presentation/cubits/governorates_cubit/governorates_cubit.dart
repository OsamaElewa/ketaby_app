import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../data/models/governorates_model.dart';
import '../../../data/repository/governorates_repository/governorates_repository.dart';
import 'governorates_state.dart';


class GovernoratesCubit extends Cubit<GovernoratesState> {
  GovernoratesCubit(this.governoratesRepository) : super(GovernoratesInitialState());

  final GovernoratesRepository governoratesRepository;


  static GovernoratesCubit get(context) => BlocProvider.of(context);


  int? dropdownValue;
  GovernoratesModel? governoratesModel;

  Future<void> getGovernorates() async {
    emit(GovernoratesLoadingState());
    Either<Failure, GovernoratesModel> result;
    result = await governoratesRepository.getGovernorates();
    result.fold((failure) {
      print(failure.error);
      emit(GovernoratesFailureState(failure.error));
    }, (governoratesModel) {
      this.governoratesModel = governoratesModel;
      emit(GovernoratesSuccessState(governoratesModel));
    });
  }
}
