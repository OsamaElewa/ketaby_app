import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/features/layout/presentation/views/widgets/user_photp_widget.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_styles.dart';


class DrawerUserData extends StatelessWidget {
  const DrawerUserData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const UserPhotoWidget(),
        SizedBox(width: AppConstants.padding10w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'OsamaElewa',
              maxLines: 1,
              style: AppStyles.textStyle16.copyWith(
                color: AppColors.white,
              ),
            ),
            Text(
              'osama@gmail.com',
              style: AppStyles.textStyle12,
            ),
          ],
        ),
      ],
    );
  }
}
