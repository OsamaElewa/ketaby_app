import '../../data/models/history_model.dart';

abstract class HistoryState {}

class HistoryInitialState extends HistoryState {}

class HistoryLoadingState extends HistoryState {}

class HistorySuccessState extends HistoryState {
  final HistoryModel historyModel;

  HistorySuccessState(this.historyModel);
}

class HistoryFailureState extends HistoryState {
  final String error;

  HistoryFailureState(this.error);
}
