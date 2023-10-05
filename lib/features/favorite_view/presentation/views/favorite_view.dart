import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/api/api_services_implementation.dart';
import 'package:ketaby/features/cart_view/presentation/views/widgets/custom_empty.dart';
import 'package:ketaby/features/favorite_view/data/repository/favorite_repository_implementation.dart';
import 'package:ketaby/features/favorite_view/presentation/views/widgets/favorite_list.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../config/icons/icons_broken.dart';
import '../../../../core/functions/show_snack_bar.dart';
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
          icon: const Icon(IconBroken.Arrow___Left_2,color: Colors.indigo,size: 30,),
        ),
        backgroundColor: Colors.transparent,
        title: const Text('Favorites',style: TextStyle(color: Colors.indigo),),
        centerTitle: true,
      ),
      body: BlocProvider(
  create: (context) => FavoriteCubit(FavoriteRepositoryImplementation(ApiServicesImplementation()))..getFavorite(),
  child: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          if(state is RemoveFavoriteSuccessState){
            showSuccessSnackBar(
                context: context, message: state.addToFavModel.message!);
          }else if (state is RemoveFavoriteFailureState) {
            showErrorSnackBar(context: context, message: state.error);
          }
        },
        builder: (context, state) {
          if(state is FavoriteSuccessState){
            return ModalProgressHUD(
              inAsyncCall: state is RemoveFavoriteLoadingState,
              color: Colors.white,
              opacity: 0.5,
              progressIndicator: const CircularProgressIndicator(),
              child: ConditionalBuilder(
                condition: FavoriteCubit.get(context).favoriteModel!.data!.favoritesList!.isNotEmpty,
                builder: (context) => const Column(
                  children: [
                    FavoriteList(),
                  ],
                ),
                fallback: (context) => CustomEmpty(title: 'Favorite is empty', image: 'assets/images/emptyfav.jpg'),
              ),
            );
          }else if(state is FavoriteFailureState){
            return const Text('empty');
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
),
    );
  }
}
