import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_constants.dart';
import '../../../cubits/new_arrival_cubit/new_arrival_cubit.dart';
import '../../../cubits/new_arrival_cubit/new_arrival_state.dart';

import 'new_arrival_list_view_item.dart';


class NewArrivalListView extends StatelessWidget {
  const NewArrivalListView({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewArrivalCubit, NewArrivalState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if(state is NewArrivalSuccessState){
          return SizedBox(
            height: 220.h,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  NewArrivalListViewItem(products: NewArrivalCubit.get(context).newArrivalModel!.data!.products![index]),
              separatorBuilder: (context, index) =>
                  SizedBox(
                    width: AppConstants.padding10w,
                  ),
              itemCount: NewArrivalCubit.get(context).newArrivalModel!.data!.products!.length,
            ),
          );
        }else if(state is NewArrivalFailureState){
          return const Text('error');
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
