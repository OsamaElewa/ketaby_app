import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/features/books_view/presentation/cubits/book_cubit.dart';
import 'package:ketaby/features/books_view/presentation/cubits/book_state.dart';
import 'package:ketaby/features/books_view/presentation/views/book_details.dart';
import 'package:ketaby/features/books_view/presentation/views/widgets/add_to_cart_button.dart';
import 'package:ketaby/features/cart_view/presentation/cubits/cart_cubit.dart';
import 'package:ketaby/features/cart_view/presentation/cubits/cart_state.dart';
import 'package:ketaby/features/favorite_view/presentation/cubits/favorite_cubit.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../data/models/book_model.dart';
import '../../cubits/add_to_cubit.dart';

class BooksListItem extends StatelessWidget {
   BooksListItem({Key? key,required this.products}) : super(key: key);

  Products products;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetails(products: products),)),
      child: Padding(
        padding: EdgeInsets.only(top: 10.h,right: 20.w,left: 20.w),
        child: Container(
          padding: EdgeInsets.only(top: 10.h,left: 20.w,bottom: 10.h),
          height: 150.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: AppColors.indigo)
          ),
          child: Row(
            children: [
              Hero(
                tag: products.id!,
                  child: Image(image: NetworkImage(products.image!),height: 110.h,width: 110.w,)),
              SizedBox(width: 15.w,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 120.w,
                          child: Text(products.name!,
                            style:  TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold,fontSize: 16.sp),
                            maxLines: 2,overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Text(products.category!),
                        SizedBox(height: 10.h,),
                        Text(products.price!),
                        SizedBox(height: 10.h,),
                        Text('${products.priceAfterDiscount!}',
                          style: AppStyles.textStyle16.copyWith(color: AppColors.indigo),),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: (){
                              AddToCubit.get(context).addToFav(productId: '${products.id!}').then((value) {
                                FavoriteCubit.get(context).getFavorite();
                              });
                            },
                            icon: const Icon(IconBroken.Heart,color: Colors.indigo,)),
                        const Spacer(),
                        AddToCartButton(products: products),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
