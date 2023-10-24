import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';

import '../../../data/model/profile_model.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    Key? key,
    required this.title,
    required this.content, required this.profileModel,
  }) : super(key: key);

  final String title;
  final String content;
  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppConstants.padding10h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.textStyle16.copyWith(
              color: AppColors.indigo,
            ),
          ),
          SizedBox(
            height: AppConstants.padding5h,
          ),
          Container(
            padding: EdgeInsets.all(AppConstants.padding5h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.radius8sp),
              color: AppColors.grey50,
            ),
            width: MediaQuery.of(context).size.width,
            //height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    content,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppStyles.textStyle16.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.updateProfileView,
                        arguments: profileModel);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppConstants.radius5sp),
                      color: Colors.white,
                    ),
                    width: 28.h,
                    height: 28.h,
                    child: Icon(
                      IconBroken.Edit,
                      color: AppColors.indigo,
                      size: AppConstants.iconSize24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
