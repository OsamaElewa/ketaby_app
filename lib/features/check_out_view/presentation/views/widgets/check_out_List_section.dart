import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/features/check_out_view/presentation/cubits/check_out_user_cubit/check_out_user_cubit.dart';
import 'package:ketaby/features/check_out_view/presentation/cubits/check_out_user_cubit/check_out_user_state.dart';

import '../../../data/models/check_out_model.dart';


class CheckOutList extends StatelessWidget {
  const CheckOutList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckOutCubit, CheckOutState>(
      listener: (context, state) {
        // TODO: implement listener
        //CheckOutCubit.get(context).checkOutModel!.data!.cartItems!
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: CheckOutCubit.get(context).checkOutModel != null,
          builder: (context) => SizedBox(
              height: 300,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildCheckoutItem(
                      CheckOutCubit.get(context)
                          .checkOutModel!
                          .data!
                          .cartItems![index]),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: CheckOutCubit.get(context)
                      .checkOutModel!
                      .data!
                      .cartItems!
                      .length)),
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildCheckoutItem(CartItems cartItems) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 250.w,
                child: Text(cartItems.itemProductName!,
                  style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,fontSize: 18),maxLines: 2,overflow: TextOverflow.ellipsis,),
              ),
              Row(
                children: [
                  const Text('Quantity : ',style: TextStyle(color: Colors.grey),),
                  Text('${cartItems.itemQuantity!}',style: TextStyle(color: Colors.grey),),
                ],
              ),
            ],
          ),
          Text(cartItems.itemProductPrice!,style: TextStyle(color: Colors.indigo,
              fontWeight: FontWeight.bold,fontSize: 15),),
        ],
      );

  Text buildText() => Text('loading');
}
