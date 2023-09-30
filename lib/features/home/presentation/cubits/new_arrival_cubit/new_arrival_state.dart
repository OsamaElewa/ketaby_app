

import '../../../data/models/new_arrival_model.dart';

abstract class NewArrivalState {}

class NewArrivalInitialState extends NewArrivalState {}

class NewArrivalLoadingState extends NewArrivalState {}

class NewArrivalSuccessState extends NewArrivalState {
  final NewArrivalModel newArrivalModel;

NewArrivalSuccessState(this.newArrivalModel);
}

class NewArrivalFailureState extends NewArrivalState {
final String error;

NewArrivalFailureState(this.error);
}
