import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../config/icons/icons_broken.dart';
import '../../../../../config/local/cache_helper.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/animations/scale_transition_animation.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../cubit/onboarding_cubit.dart';
import 'gradient_container_widget.dart';


class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleTransitionAnimation(
      duration: const Duration(seconds: 3),
      child: GradientContainerWidget(
        width: 80.h,
        height: 80.h,
        radius: 50.h,
        colors: AppColors.backgroundGradient,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        child: Center(
          child: Container(
            height: 75.h,
            width: 75.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.h),
              color: AppColors.white,
            ),
            child: Center(
              child: GradientContainerWidget(
                width: 65.h,
                height: 65.h,
                radius: 50.h,
                colors: AppColors.backgroundGradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    if (!OnBoardingCubit.get(context).isLast) {
                      OnBoardingCubit.get(context).pageController.nextPage(
                            duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.linearToEaseOut,
                          );
                    } else {
                      Navigator.pushReplacementNamed(context, Routes.loginView);
                      // CacheHelper.setBoolean(key: 'onBoarding', value: true)
                      //     .then((value) {
                      //
                      // });
                    }
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.h),
                    ),
                  ),
                  child: Icon(
                    IconBroken.Arrow___Right,
                    color: AppColors.white,
                    size: 40.h,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
