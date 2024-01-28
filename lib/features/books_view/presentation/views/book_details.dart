import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/functions/show_progress_indicator.dart';
import 'package:ketaby/core/utils/app_strings.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/gradient_button.dart';
import 'package:ketaby/features/books_view/presentation/cubits/add_to_cubit.dart';
import 'package:ketaby/features/books_view/presentation/cubits/add_to_state.dart';
import 'package:ketaby/features/favorite_view/presentation/cubits/favorite_cubit.dart';

import '../../../../core/functions/show_snack_bar.dart';
import '../../../cart_view/presentation/cubits/cart_cubit.dart';
import '../../data/models/book_model.dart';

class BookDetails extends StatelessWidget {
   BookDetails({Key? key,required this.products}) : super(key: key);
  Products products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AddToCubit, AddToState>(
  listener: (context, state) {
    if(state is AddToFavSuccessState){
      Navigator.pop(context);
      showSuccessSnackBar(
          context: context, message: state.addToFavModel.message!);
    }else if (state is AddToFavFailureState) {
      Navigator.pop(context);
      showErrorSnackBar(context: context, message: state.error);
    }
    if(state is AddToCartSuccessState){
      Navigator.pop(context);
      showSuccessSnackBar(
          context: context, message: state.addToCartModel.message!);
    }else if (state is AddToCartFailureState) {
      Navigator.pop(context);
      showErrorSnackBar(context: context, message: state.error);
    }else if(state is AddToFavLoadingState || state is AddToCartLoadingState){
      showProgressIndicator(context);
    }
  },
  builder: (context, state) {
    return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: products.id!,
                    child: Image(
                      image: NetworkImage(products.image!),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height/2,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black.withOpacity(0.5),
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(IconBroken.Arrow___Left_2)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black.withOpacity(0.5),
                        child: IconButton(
                            onPressed: (){
                              AddToCubit.get(context).addToFav(productId: '${products.id!}').then((value) {
                                FavoriteCubit.get(context).getFavorite();
                              });
                            },
                            icon: const Icon(IconBroken.Heart)),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 300,
                        child: Text(
                          products.name!,
                          style: AppStyles.productNameStyle,
                          maxLines: 2,overflow: TextOverflow.ellipsis,)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(products.category!,style: AppStyles.productCategoryStyle),
                        Column(
                          children: [
                            Text(
                              '${products.price!}  L.E',
                              style: AppStyles.productPriceStyle),
                            Text(
                              '${products.priceAfterDiscount!}  L.E',
                              style: AppStyles.productPriceAfterDiscountStyle),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Text(AppStrings.descriptionText,style: AppStyles.descriptionTitleStyle),
                    SizedBox(height: 10.h,),
                    Text(products.description!,style: AppStyles.productDescriptionStyle),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10),
                child: GradientButton(
                    onPressed: (){
                      AddToCubit.get(context).addToCart(productId: '${products.id!}').then((value) {
                        CartCubit.get(context).getCart();
                      });
                    },
                    title: const Text('Add to cart',style: TextStyle(color: Colors.white),)),
              )
            ],
          ),
        );
  },
),
    );
  }
}
