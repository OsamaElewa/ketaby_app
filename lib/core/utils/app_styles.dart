import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract class AppStyles {
  static final textStyle12 = TextStyle(
    fontSize: 10.sp,
    color: AppColors.white,
  );

  static final appBarTextStyle = TextStyle(
    color: AppColors.indigo,
  );

  static final productNameStyle = TextStyle(
    fontSize: 18.sp,
    color: AppColors.black,
    fontWeight: FontWeight.bold
  );

  static final descriptionTitleStyle = TextStyle(
      fontSize: 18.sp,
      color: AppColors.black,
      fontWeight: FontWeight.bold
  );

  static final productDescriptionStyle = TextStyle(
      fontSize: 18.sp,
      color: AppColors.grey,
  );

  static final productPriceStyle = TextStyle(
    decoration: TextDecoration.lineThrough,
    fontSize: 15.sp,
    color: AppColors.grey,
  );

  static final productPriceAfterDiscountStyle = TextStyle(
    decoration: TextDecoration.lineThrough,
    fontSize: 15.sp,
    color: AppColors.indigo,
    fontWeight: FontWeight.bold
  );

  static final productCategoryStyle = TextStyle(
      fontSize: 18.sp,
      color: AppColors.grey,
  );

  static final textStyle14 = TextStyle(
    fontSize: 12.sp,
  );
  static final textStyle15 = TextStyle(
    color: Colors.white,
    fontSize: 13.sp,
  );

  static final textStyle16 = TextStyle(
    color: Colors.grey,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static final textStyle18 = TextStyle(
    color: AppColors.black,
    fontSize: 16.sp,
  );

  static final textStyle20 = TextStyle(
    fontSize: 18.sp,
    color: AppColors.indigo,
  );

  static final textStyle25 = TextStyle(
    fontSize: 23.sp,
    color: AppColors.white,
  );

  static final textStyle30 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
  );
  static final textStyle40 = TextStyle(
    fontSize: 38.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  static final textStyle34 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
  );
}
