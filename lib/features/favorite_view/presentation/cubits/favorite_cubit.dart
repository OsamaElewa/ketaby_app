import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/features/books_view/data/models/add_to_fav_model.dart';

import '../../../../../core/errors/failures.dart';
import '../../data/models/favorite_model.dart';
import '../../data/repository/favorite_repository.dart';
import 'favorite_state.dart';


class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteRepository) : super(FavoriteInitialState());

  final FavoriteRepository favoriteRepository;


  static FavoriteCubit get(context) => BlocProvider.of(context);

  // Map<int,bool> favorites={};
  // Map<int,bool> carts={};

  List<int> togglefav = [];
  FavoriteModel? favoriteModel;

  Future<void> getFavorite() async {
    emit(FavoriteLoadingState());
    Either<Failure, FavoriteModel> result;
    result = await favoriteRepository.getFavorite();
    result.fold((failure) {
      print(failure.error);
      emit(FavoriteFailureState(failure.error));
    }, (favoriteModel) {
      this.favoriteModel = favoriteModel;
      // favoriteModel.data?.favoritesList!.forEach((element) {
      //   favorites.addAll({
      //     element.id! : element.inFavorites!,
      //   });
      // });
      favoriteModel.data!.favoritesList!.forEach((element) {
        togglefav.add(element.id!);
      });
      emit(FavoriteSuccessState(favoriteModel));
    });
  }


  FavoriteModel? addToFavModel;

  Future<void> removeFromFav({required int productId}) async {
    emit(RemoveFavoriteLoadingState());
    Either<Failure, FavoriteModel> result;
    result = await favoriteRepository.removeFromFav(productId: productId);
    result.fold((failure) {
      print(failure.error);
      emit(RemoveFavoriteFailureState(failure.error));
    }, (addToFavModel) {
      this.addToFavModel = addToFavModel;
      togglefav.remove(productId);
      emit(RemoveFavoriteSuccessState(addToFavModel));
      getFavorite();
    });
  }
}
