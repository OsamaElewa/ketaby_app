import '../../../data/models/governorates_model.dart';

abstract class GovernoratesState {}

class GovernoratesInitialState extends GovernoratesState {}

class GovernoratesLoadingState extends  GovernoratesState {}
class GovernoratesSuccessState extends  GovernoratesState {
  final GovernoratesModel governoratesModel;

 GovernoratesSuccessState(this.governoratesModel);
}

class GovernoratesFailureState extends GovernoratesState {
  final String error;

  GovernoratesFailureState(this.error);
}
