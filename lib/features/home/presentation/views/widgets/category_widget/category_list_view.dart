import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_constants.dart';
import '../../../cubits/best_seller_cubit/best_seller_state.dart';
import '../../../cubits/category_cubit/category_cubit.dart';
import '../../../cubits/category_cubit/category_state.dart';
import 'category_list_view_item.dart';


class CategoryListView extends StatelessWidget {
  const CategoryListView({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if(state is CategorySuccessState){
          return SizedBox(
            height: 80.h,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  CategoryListViewItem(categories: CategoryCubit.get(context).categoryModel!.data!.categories![index],),
              separatorBuilder: (context, index) =>
                  SizedBox(
                    width: AppConstants.padding10w,
                  ),
              itemCount: CategoryCubit.get(context).categoryModel!.data!.categories!.length,
            ),
          );
        }else if(state is CategoryFailureState){
          return const Text('error');
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
