import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ketaby/features/onboarding/presentation/views/widgets/onboarding_view_body.dart';

import '../../../../core/utils/app_constants.dart';



class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppConstants.systemUiOverlayStyleLight,
        child: OnBoardingViewBody(),
      ),
    );
  }
}
