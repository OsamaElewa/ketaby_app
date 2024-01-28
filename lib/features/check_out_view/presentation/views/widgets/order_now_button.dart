import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/functions/show_snack_bar.dart';
import 'package:ketaby/features/check_out_view/data/models/stripe_service_models/payment_intent_input_model.dart';
import 'package:ketaby/features/check_out_view/presentation/cubits/payment_cubit/payment_cubit.dart';
import 'package:ketaby/features/check_out_view/presentation/cubits/payment_cubit/payment_state.dart';
import 'package:ketaby/features/home/presentation/views/home_view.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../cubits/order_cubit/order_cubit.dart';
import '../../cubits/order_cubit/order_state.dart';

class OrderNowButton extends StatelessWidget {
  const OrderNowButton({
    Key? key,
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.total}) : super(key: key);

  final int id;
  final String total;
  final String name;
  final String email;
  final String phone;
  final String address;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if(state is PaymentSuccessState){
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

        }
        if(state is PaymentFailureState){
          print(state.error);
        }
      },
      builder: (context, state) {
        num determineTotal = num.parse(total)*100;
        int intTotal = determineTotal.toInt();
        print(determineTotal);
        print(intTotal);
        return ConditionalBuilder(
            condition: state is !PaymentLoadingState,
            builder: (context) => Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25)
          ),
          child: TextButton(
            onPressed: () {
              PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(amount: intTotal.toString(), currency: 'USD', customerId: 'cus_OxojQwVG0zjS0Q');
              PaymentCubit.get(context).makePayment(paymentIntentInputModel: paymentIntentInputModel).then((value) {

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
