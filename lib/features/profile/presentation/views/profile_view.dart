import 'package:flutter/material.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_strings.dart';
import 'package:ketaby/core/widgets/custom_back_button.dart';
import 'package:ketaby/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(color: AppColors.indigo),
        backgroundColor: AppColors.transparent,
        title:  const Text(AppStrings.profile,style: TextStyle(color: AppColors.indigo),),
      ),
      resizeToAvoidBottomInset: false,
      body: const AnnotatedRegion(
        value: AppConstants.systemUiOverlayStyleDark,
        child: ProfileViewBody(),
      ),
    );
  }
}
