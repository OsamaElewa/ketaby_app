import 'package:flutter/cupertino.dart';
import 'package:ketaby/features/books_view/presentation/views/widgets/books_list_item.dart';
import 'package:ketaby/features/favorite_view/presentation/cubits/favorite_cubit.dart';

import '../../cubits/cart_cubit.dart';
import 'cart_list_item.dart';


class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) =>  CartListItem(cartItems: CartCubit.get(context).cartModel!.data!.cartItems![index],),
          separatorBuilder: (context, index) => const SizedBox(height: 10,),
          itemCount: CartCubit.get(context).cartModel!.data!.cartItems!.length
      ),
    );
  }
}
