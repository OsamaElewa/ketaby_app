import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/features/profile/presentation/views/widgets/image_user_profile.dart';
import 'package:ketaby/features/profile/presentation/views/widgets/name_and_email_user_profile.dart';
import 'package:ketaby/features/profile/presentation/views/widgets/profile_item_widget.dart';

import '../../../../config/local/cache_helper.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../../../../core/widgets/loading_indicator_widget.dart';
import '../cubits/get_user_profile_cubit.dart';
import '../cubits/get_user_profile_state.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<GetUserProfileCubit, GetUserProfileState>(
        builder: (context, state) {
          if (state is GetUserProfileSuccessState) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(AppConstants.defaultPadding),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   ImageUserProfile( image: GetUserProfileCubit.get(context).profileModel!.data!.image!,),
                  NameAndEmailUserProfile(
                    name: state.profileModel.data!.name!,
                    email: state.profileModel.data!.email!,
                  ),
                  ProfileItemWidget(
                      title: 'Name',
                      content: state.profileModel.data!.name!,
                      onTap: () {}),
                  ProfileItemWidget(
                      title: 'Email',
                      content: state.profileModel.data!.email!,
                      onTap: () {}),
                  ProfileItemWidget(
                      title: 'Phone',
                      content: state.profileModel.data!.phone!,
                      onTap: () {}),
                  ProfileItemWidget(
                      title: 'Gender',
                      content: state.profileModel.data!.address!,
                      onTap: () {}),
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
                    title: 'Logout',
                  ),
                ],
              ),
            );
          } else if (state is GetUserProfileFailureState) {
            return CustomErrorWidget(error: state.error);
          } else {
            return const LoadingIndicatorWidget();
          }
        },
      ),
    );
  }
}
