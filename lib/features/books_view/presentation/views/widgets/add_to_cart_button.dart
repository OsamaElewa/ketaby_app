import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/features/books_view/data/models/book_model.dart';
import 'package:ketaby/features/books_view/presentation/cubits/add_to_cubit.dart';

import '../../../../../config/icons/icons_broken.dart';
import '../../../../cart_view/presentation/cubits/cart_cubit.dart';
import '../../../../cart_view/presentation/cubits/cart_state.dart';
import '../../cubits/book_cubit.dart';

class AddToCartButton extends StatelessWidget {
  AddToCartButton({super.key, required this.products});
  Products products;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit,CartState>(
      builder:(context, state) {
        return IconButton(
            onPressed: (){
              AddToCubit.get(context).addToCart(productId: '${products.id!}').then((value) {
                CartCubit.get(context).getCart();
              });
            },
            icon: const Icon(IconBroken.Buy,color: Colors.indigo,));
      },
    );
  }
}
