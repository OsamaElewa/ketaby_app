import 'package:flutter/material.dart';

import '../../config/icons/icons_broken.dart';
import '../../config/local/cache_helper.dart';
import '../../config/routes/app_routes.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';


class LogoutIconButton extends StatelessWidget {
  const LogoutIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        CacheHelper.removeData(key: 'token').then((value) {
          Navigator.pushReplacementNamed(context, Routes.loginView);
        });
      },
      icon:  Icon(
        IconBroken.Logout,
        color: AppColors.white,
        size: AppConstants.iconSize28,
      ),
    );
  }
}