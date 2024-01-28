import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ketaby/features/cart_view/presentation/views/widgets/custom_empty.dart';
import 'package:ketaby/features/favorite_view/data/models/favorite_model.dart';
import 'package:ketaby/features/favorite_view/presentation/cubits/remove_from_fav_state.dart';
import 'package:ketaby/features/favorite_view/presentation/views/widgets/favorite_list.dart';

import '../../../../config/icons/icons_broken.dart';
import '../cubits/favorite_cubit.dart';
import '../cubits/favorite_state.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            IconBroken.Arrow___Left_2,
            color: Colors.indigo,
            size: 30,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Favorites',
          style: TextStyle(color: Colors.indigo),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          if (state is RemoveFromFavSuccessState) {
            //showSuccessSnackBar(context: context, message: state..message!);
          } else if (state is RemoveFromFavFailureState) {
            //showErrorSnackBar(context: context, message: state.error);
          }
        },
        builder: (context, state) {
          FavoriteModel? favoriteModel = FavoriteCubit.get(context).favoriteModel;
          if(favoriteModel!.data!.favoritesList!.isNotEmpty){
            return const Column(
              children: [
                FavoriteList(),
              ],
            );
          }else{
            return CustomEmpty(
                title: 'Favorite is empty',
                image: 'assets/images/emptyfav.jpg');
          }
        },
      ),
    );
  }
}
