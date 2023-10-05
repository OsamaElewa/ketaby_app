import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/features/check_out_view/presentation/cubits/governorates_cubit/governorates_cubit.dart';
import 'package:ketaby/features/check_out_view/presentation/cubits/order_cubit/order_cubit.dart';
import 'package:ketaby/features/check_out_view/presentation/cubits/order_cubit/order_state.dart';
import 'package:ketaby/features/check_out_view/presentation/views/widgets/order_now_button.dart';

import '../../cubits/check_out_user_cubit/check_out_user_cubit.dart';
import '../../cubits/check_out_user_cubit/check_out_user_state.dart';

class OrderNowSection extends StatelessWidget {
  const OrderNowSection({Key? key, required this.name, required this.email, required this.phone, required this.address, required this.govId}) : super(key: key);

  final String name;
  final String email;
  final String phone;
  final String address;
  final int govId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckOutCubit, CheckOutState>(
  builder: (context, state) {
    return Container(
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
              Text('${CheckOutCubit.get(context).checkOutModel!.data!.total} L.E',style: TextStyle(color: Colors.white,fontSize: 17),)
            ],
          ),
          OrderNowButton(
            id: govId,
            name: name,
            email: email,
            phone: phone,
            address: address,
          ),
        ],
      ),
    );
  },
);
  }
}
