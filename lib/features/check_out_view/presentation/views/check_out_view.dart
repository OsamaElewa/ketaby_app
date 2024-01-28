import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/api/api_services_implementation.dart';
import 'package:ketaby/features/check_out_view/data/repository/check_out_repository/check_out_repository_implementation.dart';
import 'package:ketaby/features/check_out_view/presentation/cubits/check_out_user_cubit/check_out_user_cubit.dart';
import 'package:ketaby/features/check_out_view/presentation/views/widgets/check_city_section.dart';
import 'package:ketaby/features/check_out_view/presentation/views/widgets/check_out_List_section.dart';
import 'package:ketaby/features/check_out_view/presentation/views/widgets/order_now_section.dart';
import 'package:ketaby/features/check_out_view/presentation/views/widgets/text_field_section.dart';

import '../../../../config/icons/icons_broken.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            IconBroken.Arrow___Left_2, color: Colors.indigo, size: 30,),
        ),
        backgroundColor: Colors.transparent,
        title: const Text('Check Out', style: TextStyle(color: Colors.indigo),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CheckOutViewBody(),
            ],
          ),
        ),
      ),
    );
  }
}
