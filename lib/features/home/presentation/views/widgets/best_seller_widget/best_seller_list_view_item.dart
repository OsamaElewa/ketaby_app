import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/widgets/custom_network_image.dart';
import '../../../../data/models/best_seller_model.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({Key? key, required this.products}) : super(key: key);

  final Products products;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      decoration: BoxDecoration(
        color: AppColors.grey50,
        borderRadius: BorderRadius.circular(AppConstants.radius10w),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppConstants.padding8h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomNetworkImage(
                borderRadius: AppConstants.radius8w,
                image: products.image!,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppConstants.padding3h),
              child: Text(
                products.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              products.description!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.textStyle16.copyWith(
                color: AppColors.grey,
              ),
            ),
            Text(
              '${products.discount!}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.textStyle16.copyWith(
                color: AppColors.grey,
              ),
            ),
            Text(
              products.price!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.textStyle16.copyWith(
                color: AppColors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
