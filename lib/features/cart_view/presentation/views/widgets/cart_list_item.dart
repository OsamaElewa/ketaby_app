import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
      child: Container(
        padding: const EdgeInsets.only(top: 10,left: 20,bottom: 10,),
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.indigo)
        ),
        child: Row(
          children: [
            Image(image: NetworkImage(cartItems.itemProductImage!)),
            const SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 175,
                  child: Text(cartItems.itemProductName!,
                    style: const TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,fontSize: 18),
                    maxLines: 2,overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 10,),
                Text(cartItems.itemProductPrice!),
                const SizedBox(height: 10,),
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
