import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/features/cart_view/data/models/cart_model.dart';
import 'package:ketaby/features/cart_view/presentation/cubits/cart_cubit.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../cubits/remove_from_cart_cubit/remove_from_cart_cubit.dart';
import '../../cubits/update_cart_cubit/update_cart_cubit.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({Key? key,required this.cartItems}) : super(key: key);

  final CartItems cartItems;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top: 10.h,right: 10.w,left: 10.w),
      child: Container(
        padding: EdgeInsets.only(top: 10.h,left: 20.w,bottom: 10.h,),
        height: 150.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: AppColors.indigo)
        ),
        child: Row(
          children: [
            Image(image: NetworkImage(cartItems.itemProductImage!),height: 110.h,width: 110.w,),
            SizedBox(width: 15.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120.w,
                  child: Text(cartItems.itemProductName!,
                    style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,fontSize: 16.sp),
                    maxLines: 2,overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 10.h,),
                Text(cartItems.itemProductPrice!),
                SizedBox(height: 10.h,),
              ],
            ),
            Column(
              children: [
                IconButton(
                    onPressed: (){
                      RemoveFromCartCubit.get(context)
                          .removeFromCart(
                          bookId: cartItems.itemId.toString(),
                          context: context)
                          .then((value) {
                            CartCubit.get(context).getCart();
                      });
                      //CartCubit.get(context).removeFromCart(productId: '${cartItems.itemId!}');
                    },
                    icon: const Icon(IconBroken.Delete,color: Colors.red,)),
                const Spacer(),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if(cartItems.itemQuantity! >1){
                          UpdateCartCubit.get(context)
                              .updateCart(
                            bookId: cartItems.itemId.toString(),
                            quantity: (cartItems.itemQuantity! - 1).toString(),
                          )
                              .then((value) {
                                CartCubit.get(context).getCart();
                          });
                          //CartCubit.get(context).updateFromCart(productId: '${cartItems.itemId}', quantity: '${cartItems.itemQuantity! -1}');
                        }
                      },
                        child: Icon(Icons.remove,size: 25,color: Colors.red,)),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('${cartItems.itemQuantity}',style: TextStyle(color: Colors.indigo,fontSize: 17),),
                    ),
                    InkWell(
                      onTap: (){
                        UpdateCartCubit.get(context)
                            .updateCart(
                          bookId: cartItems.itemId.toString(),
                          quantity: (cartItems.itemQuantity! + 1).toString(),
                        )
                            .then((value) {
                          CartCubit.get(context).getCart();
                        });
                        //CartCubit.get(context).updateFromCart(productId: '${cartItems.itemId}', quantity: '${cartItems.itemQuantity! +1}');
                      },
                        child: const Icon(Icons.add,size: 25,color: Colors.indigo,))

                  ],
                )
              ],
            ),


          ],
        ),
      ),
    );
  }
}
