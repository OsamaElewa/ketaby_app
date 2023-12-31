import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ketaby/features/splash/presentation/views/widgets/splash_view_body.dart';

import '../../../../config/local/cache_helper.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_constants.dart';



class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigateToOnBoardingView();
    super.initState();
  }
//CacheHelper.getBoolean(key: 'onBoarding') ??
  void navigateToOnBoardingView() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (false) {
        if (AppConstants.token.isNotEmpty) {
         // return Navigator.pushReplacementNamed(context, Routes.layoutView);
        } else {
          return Navigator.pushReplacementNamed(context, Routes.loginView);
        }
      } else {
        return Navigator.pushReplacementNamed(context, Routes.onBoardingView);
      }
      //return Navigator.pushReplacementNamed(context, Routes.loginView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppConstants.systemUiOverlayStyleDark,
        child: SplashViewBody(),
      ),
    );
  }
}
