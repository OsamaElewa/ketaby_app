import 'package:flutter/material.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_strings.dart';
import 'package:ketaby/core/widgets/custom_back_button.dart';
import 'package:ketaby/features/profile/presentation/views/widgets/update_profile_view_body.dart';

import '../../data/model/profile_model.dart';
import '../cubits/update_user_profile_cubit/update_user_profile_cubit.dart';


class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({
    Key? key,
    required this.profileModel,
  }) : super(key: key);

  final ProfileModel profileModel;

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  @override
  void initState() {
    UpdateUserProfileCubit.get(context).nameController.text =
        widget.profileModel.data!.name!;
    UpdateUserProfileCubit.get(context).emailController.text =
        widget.profileModel.data!.email!;
    UpdateUserProfileCubit.get(context).cityController.text =
        widget.profileModel.data!.city!;
    UpdateUserProfileCubit.get(context).addressController.text =
        widget.profileModel.data!.address!;
    UpdateUserProfileCubit.get(context).phoneController.text =
        widget.profileModel.data!.phone!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: const Text(AppStrings.updateProfile,style: TextStyle(color: AppColors.indigo),),
        leading: const CustomBackButton(color: AppColors.indigo,),
      ),
      body: UpdateProfileViewBody(
        profileModel: widget.profileModel,
      ),
    );
  }
}
