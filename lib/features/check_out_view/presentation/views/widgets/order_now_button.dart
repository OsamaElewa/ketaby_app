import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/functions/show_snack_bar.dart';
import 'package:ketaby/features/home/presentation/views/home_view.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../cubits/order_cubit/order_cubit.dart';
import '../../cubits/order_cubit/order_state.dart';

class OrderNowButton extends StatelessWidget {
  const OrderNowButton({Key? key, required this.id, required this.name, required this.email, required this.phone, required this.address}) : super(key: key);

  final int id;
  final String name;
  final String email;
  final String phone;
  final String address;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return ConditionalBuilder(
            condition: state is !OrderLoadingState,
            builder: (context) => Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25)
          ),
          child: TextButton(
            onPressed: () {
              OrderCubit.get(context).placeOrder(
                  id: id,
                  name: name,
                  email: email,
                  phone: phone,
                  address: address
              ).then((value) {
                showSuccessSnackBar(context: context, message: 'the order is placed successfully');
                Navigator.pushReplacementNamed(context, Routes.layoutView);
              });
            },
            child: const Text(
              'Order Now',
              style: TextStyle(color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
        ),
            fallback:(context) => const Center(child: CircularProgressIndicator(color: Colors.white),),
        );
      },
    );
  }
}
