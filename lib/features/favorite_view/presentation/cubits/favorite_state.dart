


import 'package:ketaby/features/books_view/data/models/add_to_fav_model.dart';

import '../../data/models/favorite_model.dart';

abstract class FavoriteState {}

class FavoriteInitialState extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteSuccessState extends FavoriteState {
  final FavoriteModel favoriteModel;

 FavoriteSuccessState(this.favoriteModel);
}

class FavoriteFailureState extends FavoriteState {
  final String error;

  FavoriteFailureState(this.error);
}



class RemoveFavoriteLoadingState extends FavoriteState {}

class RemoveFavoriteSuccessState extends FavoriteState {
  final FavoriteModel addToFavModel;

  RemoveFavoriteSuccessState(this.addToFavModel);
}

class RemoveFavoriteFailureState extends FavoriteState {
  final String error;

  RemoveFavoriteFailureState(this.error);
}
