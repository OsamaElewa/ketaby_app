import 'package:flutter/material.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/features/favorite_view/presentation/cubits/favorite_cubit.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../data/models/favorite_model.dart';

class FavoriteListItem extends StatelessWidget {
  const FavoriteListItem({Key? key,required this.favorite}) : super(key: key);

  final Favorite favorite;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 10,right: 20,left: 20),
      child: Container(
        padding: const EdgeInsets.only(top: 10,left: 20,bottom: 10),
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.indigo)
        ),
        child: Row(
          children: [
            Image(image: NetworkImage(favorite.image!)),
            const SizedBox(width: 15,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 175,
                        child: Text(favorite.name!,
                          style: const TextStyle(color: Colors.black,
                              fontWeight: FontWeight.bold,fontSize: 18),
                          maxLines: 2,overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(favorite.category!),
                      const SizedBox(height: 10,),
                      Text(favorite.price!),
                      const SizedBox(height: 10,),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: (){
                            FavoriteCubit.get(context).removeFromFav(productId: favorite.id!);
                          },
                          icon: const Icon(IconBroken.Heart,color: Colors.red,)),
                      const Spacer(),
                      IconButton(
                          onPressed: (){},
                          icon: const Icon(IconBroken.Buy,color: Colors.indigo,)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
