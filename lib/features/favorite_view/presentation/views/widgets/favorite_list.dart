import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/features/books_view/presentation/views/widgets/books_list_item.dart';
import 'package:ketaby/features/favorite_view/presentation/cubits/favorite_cubit.dart';
import 'package:ketaby/features/favorite_view/presentation/cubits/favorite_state.dart';

import 'favorite_list_item.dart';


class FavoriteList extends StatelessWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit,FavoriteState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) =>  FavoriteListItem(favorite: FavoriteCubit.get(context).favoriteModel!.data!.favoritesList![index],),
              separatorBuilder: (context, index) => const SizedBox(height: 10,),
              itemCount: FavoriteCubit.get(context).favoriteModel!.data!.favoritesList!.length
          ),
        );
      },
    );
  }
}
