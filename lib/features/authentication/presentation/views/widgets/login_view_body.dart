import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/functions/show_progress_indicator.dart';

import '../../../../../config/local/cache_helper.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/gradient_button.dart';
import '../../../../../core/widgets/title_and_subtitle.dart';
import '../../cubits/login_cubit/login_cubit.dart';
import '../../cubits/login_cubit/login_state.dart';
import 'keep_me_logged_in.dart';
import 'login_texts_fields_section.dart';
import 'nanigate_to_login_or_register.dart';


class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (LoginCubit.get(context).keepMeLoggedIn) {
            CacheHelper.setString(
              key: 'token',
              value: LoginCubit.get(context).loginModel!.data!.token!,
            );
            AppConstants.token = state.authenticationModel.data!.token!;
          } else {
            AppConstants.token = state.authenticationModel.data!.token!;
          }
          Navigator.pushReplacementNamed(context, Routes.layoutView);
          showSuccessSnackBar(
              context: context, message: state.authenticationModel.message!);
        } else if (state is LoginFailureState) {
          showErrorSnackBar(context: context, message: state.error);
          Navigator.pop(context);
        }else if(state is LoginLoadingState){
          showProgressIndicator(context);
        }

      },
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            child: Form(
              key: LoginCubit.get(context).formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TitleAndSubtitle(
                    subtitle: AppStrings.loginSubtitle,
                    title: AppStrings.loginTitle,
                  ),
                  const LoginTextsFieldsSection(),
                  const KeepMeLoggedIn(),
                  NavigateToLoginOrRegister(
                    textTitle: AppStrings.doNotHaveAccountText,
                    buttonTitle: AppStrings.register,
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.registerView);
                    },
                  ),
                  GradientButton(
                    onPressed: () {
                      if (LoginCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        LoginCubit.get(context).userLogin();
                      }
                    },
                    title: Text(AppStrings.login,style: AppStyles.textStyle16.copyWith(
                      color: AppColors.white,),
                  ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
