import 'package:flutter/material.dart';
import 'package:ketaby/features/authentication/presentation/views/widgets/register_view_body.dart';

import '../../../../core/utils/app_constants.dart';


class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion(
        value: AppConstants.systemUiOverlayStyleDark,
        child: RegisterViewBody(),
      ),
    );
  }
}
