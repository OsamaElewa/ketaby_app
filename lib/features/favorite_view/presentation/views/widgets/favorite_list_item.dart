import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/features/favorite_view/presentation/cubits/favorite_cubit.dart';
import 'package:ketaby/features/favorite_view/presentation/cubits/remove_from_fav_cubit.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../data/models/favorite_model.dart';

class FavoriteListItem extends StatelessWidget {
  const FavoriteListItem({Key? key,required this.favorite}) : super(key: key);

  final Favorite favorite;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(top: 10.h,right: 20.w,left: 20.w),
      child: Container(
        padding: EdgeInsets.only(top: 10.h,left: 20.w,bottom: 10.h),
        height: 150.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: AppColors.indigo)
        ),
        child: Row(
          children: [
            Image(image: NetworkImage(favorite.image!),height: 110.h,width: 110.w,),
            SizedBox(width: 15.w,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 120,
                        child: Text(favorite.name!,
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.bold,fontSize: 16.sp),
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
                            RemoveFromFavCubit.get(context).removeFromFav(productId: favorite.id!, context: context).then((value) {
                              FavoriteCubit.get(context).getFavorite();
                            });
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
