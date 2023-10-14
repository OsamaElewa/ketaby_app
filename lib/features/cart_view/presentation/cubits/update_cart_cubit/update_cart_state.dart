abstract class UpdateCartState {}

class UpdateeCartInitialState extends UpdateCartState {}

class UpdateeCartLoadingState extends UpdateCartState {}

class UpdateeCartSuccessState extends UpdateCartState {}

class UpdateeCartFailureState extends UpdateCartState {
  final String error;
  UpdateeCartFailureState(this.error);
}
