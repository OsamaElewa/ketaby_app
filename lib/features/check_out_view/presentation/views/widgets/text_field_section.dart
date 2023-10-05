import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/api/api_services_implementation.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/widgets/custom_dropdown.dart';
import 'package:ketaby/features/check_out_view/data/repository/check_out_repository/check_out_repository_implementation.dart';
import 'package:ketaby/features/check_out_view/presentation/cubits/check_out_user_cubit/check_out_user_cubit.dart';
import 'package:ketaby/features/check_out_view/presentation/cubits/check_out_user_cubit/check_out_user_cubit.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import '../../cubits/check_out_user_cubit/check_out_user_state.dart';
import 'check_city_section.dart';
import 'check_out_List_section.dart';
import 'order_now_section.dart';

class CheckOutViewBody extends StatelessWidget {
  CheckOutViewBody({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckOutCubit, CheckOutState>(
        listener: (context, state) {
          if (state is CheckOutUserSuccessState) {
            nameController.text =
                CheckOutCubit.get(context).checkOutModel!.data!.user!.userName!;
            emailController.text =
                CheckOutCubit.get(context).checkOutModel!.data!.user!.userEmail!;
            phoneController.text =
                CheckOutCubit.get(context).checkOutModel!.data!.user!.phone!;
            addressController.text =
                CheckOutCubit.get(context).checkOutModel!.data!.user!.address!;
          }
        },
        builder: (context, state) {
          if(CheckOutCubit.get(context).checkOutModel !=null){
            nameController.text =
            CheckOutCubit.get(context).checkOutModel!.data!.user!.userName!;
            emailController.text =
            CheckOutCubit.get(context).checkOutModel!.data!.user!.userEmail!;
            phoneController.text =
            CheckOutCubit.get(context).checkOutModel!.data!.user!.phone!;
            addressController.text =
            CheckOutCubit.get(context).checkOutModel!.data!.user!.address!;
          }
          return ConditionalBuilder(
            condition: CheckOutCubit.get(context).checkOutModel !=null,
            builder: (context) => Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextField(
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      title: 'name',
                      hintText: 'name'),
                  CustomTextField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      title: 'email',
                      hintText: 'email'),
                  CustomTextField(
                      controller: phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone';
                        }
                        return null;
                      },
                      title: 'phone',
                      hintText: 'phone'),
                  CustomTextField(
                      controller: addressController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                      title: 'address',
                      hintText: 'address'),
                  const CheckCitySection(),
                  const Divider(
                    color: Colors.grey,
                    thickness: 2,
                    height: 1,
                  ),
                  const SizedBox(height: 10,),
                  const CheckOutList(),
                  OrderNowSection(
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    address: addressController.text,
                    govId: AppConstants.govid,
                  ),
                ],
              ),
            ),
            fallback: (context) => const CircularProgressIndicator(),
          );
        },
      );
  }
}
