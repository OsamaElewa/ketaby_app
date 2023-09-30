import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_constants.dart';
import '../../../cubits/best_seller_cubit/best_seller_cubit.dart';
import '../../../cubits/best_seller_cubit/best_seller_state.dart';
import 'best_seller_list_view_item.dart';


class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BestSellerCubit, BestSellerState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if(state is BestSellerSuccessState){
          return SizedBox(
            height: 220.h,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  BestSellerListViewItem(products: BestSellerCubit.get(context).bestSellerModel!.data!.products![index],),
              separatorBuilder: (context, index) =>
                  SizedBox(
                    width: AppConstants.padding10w,
                  ),
              itemCount: BestSellerCubit.get(context).bestSellerModel!.data!.products!.length,
            ),
          );
        }else if(state is BestSellerFailureState){
          return const Text('error');
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
