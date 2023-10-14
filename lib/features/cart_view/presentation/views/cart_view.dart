import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/api/api_services_implementation.dart';
import 'package:ketaby/features/cart_view/data/models/cart_model.dart';
import 'package:ketaby/features/cart_view/data/repository/cart_repository_implementation.dart';
import 'package:ketaby/features/cart_view/presentation/views/widgets/cart_list.dart';
import 'package:ketaby/features/cart_view/presentation/views/widgets/custom_empty.dart';
import 'package:ketaby/features/check_out_view/presentation/views/check_out_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../config/icons/icons_broken.dart';
import '../../../../core/functions/show_snack_bar.dart';
import '../cubits/cart_cubit.dart';
import '../cubits/cart_state.dart';



class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(IconBroken.Arrow___Left_2,color: Colors.indigo,size: 30,),
        ),
        backgroundColor: Colors.transparent,
        title: const Text('Cart',style: TextStyle(color: Colors.indigo),),
        centerTitle: true,
      ),
      body: const CartList(),
    );
  }
}
