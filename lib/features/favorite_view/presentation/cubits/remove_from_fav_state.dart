abstract class RemoveFromFavState {}

class RemoveFromFavInitialState extends RemoveFromFavState {}

class RemoveFromFavLoadingState extends RemoveFromFavState {}

class RemoveFromFavSuccessState extends RemoveFromFavState {}

class RemoveFromFavFailureState extends RemoveFromFavState {
  final String error;
  RemoveFromFavFailureState(this.error);
}
