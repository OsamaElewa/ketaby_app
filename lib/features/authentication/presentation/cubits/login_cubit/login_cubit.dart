import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/authentication_model/authentication_model.dart';
import '../../../data/repository/authentication_repository.dart';
import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authenticationRepository) : super(LoginInitialState());

  final AuthenticationRepository authenticationRepository;

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isShowPassword = true;

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    emit(LoginChangePasswordVisibilityState());
  }

  bool keepMeLoggedIn = false;
  void changeKeepMeLoggedIn({required bool value}) {
    keepMeLoggedIn = value;
    emit(LoginChangeKeepMeLoggedInState());
  }

  AuthenticationModel? loginModel;

  Future<void> userLogin() async {
    emit(LoginLoadingState());
    Either<Failure, AuthenticationModel> result;
    result = await authenticationRepository.userLogin(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold((failure) {
      emit(LoginFailureState(failure.error));
    }, (loginModel) {
      this.loginModel = loginModel;
      emit(LoginSuccessState(loginModel));
    });
  }
}
