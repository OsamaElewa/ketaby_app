import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/features/cart_view/presentation/cubits/cart_cubit.dart';
import 'package:ketaby/features/cart_view/presentation/cubits/cart_state.dart';

import 'books_list.dart';

class ModalProgressLoading extends StatelessWidget {
  const ModalProgressLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit,CartState>(
        builder: (context, state) {
          return const Column(
            children: [
              BooksList(),
            ],
          );
        },
    );
  }
}
