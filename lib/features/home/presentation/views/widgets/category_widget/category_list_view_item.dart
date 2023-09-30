import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../data/models/category_model.dart';

class CategoryListViewItem extends StatelessWidget {
  const CategoryListViewItem({Key? key, required this.categories}) : super(key: key);

  final Categories categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        //color: AppColors.grey50,
        borderRadius: BorderRadius.circular(AppConstants.radius10w),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image(image: AssetImage('assets/images/bro.png'),height: double.infinity,width: double.infinity,),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration:  BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              //color: AppColors.grey50,
              borderRadius: BorderRadius.circular(AppConstants.radius10w),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Text(
                  categories.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
