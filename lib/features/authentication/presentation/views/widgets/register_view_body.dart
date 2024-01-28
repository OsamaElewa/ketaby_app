import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/features/authentication/presentation/views/widgets/register_texts_fields_section.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/functions/show_progress_indicator.dart';
import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/gradient_button.dart';
import '../../../../../core/widgets/title_and_subtitle.dart';
import '../../cubits/register_cubit/register_cubit.dart';
import '../../cubits/register_cubit/register_state.dart';
import 'nanigate_to_login_or_register.dart';


class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          AppConstants.token = state.authenticationModel.data!.token!;
          Navigator.pushNamed(context, Routes.layoutView);
          showSuccessSnackBar(
              context: context, message: state.authenticationModel.message!);
        } else if (state is RegisterFailureState) {
          Navigator.pop(context);
          showErrorSnackBar(context: context, message: state.error);
        }else if(state is RegisterLoadingState){
          showProgressIndicator(context);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TitleAndSubtitle(
                      subtitle: AppStrings.registerSubtitle,
                      title: AppStrings.registerTitle,
                    ),
                    const RegisterTextsFieldsSection(),
                    NavigateToLoginOrRegister(
                      textTitle: AppStrings.alreadyHaveAccountText,
                      buttonTitle: AppStrings.login,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    GradientButton(
                      title: Text(AppStrings.register,style: AppStyles.textStyle16.copyWith(
                        color: AppColors.white,)
                      ),
                      onPressed: () {
                        if (RegisterCubit.get(context)
                            .formKey
                            .currentState!
                            .validate()) {
                          RegisterCubit.get(context).userRegister();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
