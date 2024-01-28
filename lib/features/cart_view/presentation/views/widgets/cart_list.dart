import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/core/functions/show_progress_indicator.dart';
import 'package:ketaby/features/cart_view/presentation/cubits/cart_state.dart';

import '../../../data/models/cart_model.dart';
import '../../cubits/cart_cubit.dart';
import '../../cubits/remove_from_cart_cubit/remove_from_cart_state.dart';
import '../../cubits/update_cart_cubit/update_cart_state.dart';
import 'cart_list_item.dart';
import 'custom_empty.dart';


class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
  listener: (context, state) {
    // TODO: implement listener
    if(state is RemoveFromCartSuccessState || state is UpdateeCartSuccessState){
      print('done');
    }else if (state is RemoveFromCartFailureState || state is UpdateeCartFailureState) {
      print('done');
    }else if(state is CartLoadingState){
      showProgressIndicator(context);
    }else if(state is CartSuccessState){
      Navigator.pop(context);
    }else if(state is CartFailureState){
      Navigator.pop(context);
    }
  },
  builder: (context, state) {
    CartModel? cartModel = CartCubit.get(context).cartModel;
    if(cartModel!.data!.cartItems!.isNotEmpty)
      {
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) =>  CartListItem(cartItems: CartCubit.get(context).cartModel!.data!.cartItems![index],),
                  separatorBuilder: (context, index) => SizedBox(height: 10.h,),
                  itemCount: CartCubit.get(context).cartModel!.data!.cartItems!.length
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.all(10),
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Total price : ',style: TextStyle(color: Colors.white,fontSize: 17),),
                        Text('${CartCubit.get(context).cartModel!.data!.total} L.E',style: TextStyle(color: Colors.white,fontSize: 17),)
                      ],
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, Routes.checkoutView);
                        },
                        child: const Text(
                          'Check Out',
                          style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 17),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }else{
      return CustomEmpty(title: 'cart is empty', image: 'assets/images/emptyCart.png');
    }
  },
);
  }
}
