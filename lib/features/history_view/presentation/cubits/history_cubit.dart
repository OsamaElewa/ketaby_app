import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../data/models/history_model.dart';
import '../../data/repository/history_repository.dart';
import 'history_state.dart';


class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this.historyRepository) : super(HistoryInitialState());

  final HistoryRepository historyRepository;


  static HistoryCubit get(context) => BlocProvider.of(context);

  HistoryModel? historyModel;

  Future<void> getHistory() async {
    emit(HistoryLoadingState());
    Either<Failure, HistoryModel> result;
    result = await historyRepository.getHistory();
    result.fold((failure) {
      print(failure.error);
      emit(HistoryFailureState(failure.error));
    }, (historyModel) {
      this.historyModel = historyModel;
      emit(HistorySuccessState(historyModel));
    });
  }
}
