import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/config/local/cache_helper.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_strings.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/custom_error_widget.dart';
import 'package:ketaby/core/widgets/gradient_button.dart';
import 'package:ketaby/core/widgets/loading_indicator_widget.dart';
import 'package:ketaby/features/profilee/presentation/views/widgets/profile_item_widget.dart';

import '../../cubits/get_user_profile_cubit/get_user_profile_cubit.dart';
import '../../cubits/get_user_profile_cubit/get_user_profile_state.dart';
import 'image_user_profile.dart';
import 'name_and_email_user_profile.dart';


class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserProfileCubit, GetUserProfileState>(
      builder: (context, state) {
        if (state is GetUserProfileSuccessState) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: AppConstants.defaultPadding,
                right: AppConstants.defaultPadding,
              ),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageUserProfile(imagePath: state.profileModel.data!.image!,),
                  NameAndEmailUserProfile(
                    name: state.profileModel.data!.name!,
                    email: state.profileModel.data!.email!,
                  ),
                  ProfileItemWidget(
                    title: 'Name',
                    content: state.profileModel.data!.name!,
                    profileModel: state.profileModel,
                  ),
                  ProfileItemWidget(
                      title: 'Email',
                      content: state.profileModel.data!.email!,
                    profileModel: state.profileModel,
                      ),
                  ProfileItemWidget(
                      title: 'Phone',
                      content: state.profileModel.data!.phone!,
                    profileModel: state.profileModel,
                      ),
                  ProfileItemWidget(
                      title: 'City',
                      content: state.profileModel.data!.city!,
                    profileModel: state.profileModel,
                      ),
                  ProfileItemWidget(
                      title: 'Address',
                      content: state.profileModel.data!.address!,
                    profileModel: state.profileModel,
                      ),
                  SizedBox(
                    height: AppConstants.padding20h,
                  ),
                  GradientButton(
                    onPressed: () {
                      CacheHelper.removeData(key: 'token').then((value) {
                        Navigator.pushReplacementNamed(
                            context, Routes.loginView);
                      });
                    },
                    title: Text(
                      AppStrings.logout,
                      style: AppStyles.textStyle16
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is GetUserProfileFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const LoadingIndicatorWidget();
        }
      },
    );
  }
}
