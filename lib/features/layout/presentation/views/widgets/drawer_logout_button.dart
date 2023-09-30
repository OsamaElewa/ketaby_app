import 'package:flutter/material.dart';

import '../../../../../config/icons/icons_broken.dart';
import '../../../../../config/local/cache_helper.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../authentication/presentation/views/login_view.dart';
import '../../cubits/animated_drawer_cubit/animated_drawer_cubit.dart';

class DrawerLogoutButton extends StatelessWidget {
  const DrawerLogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CacheHelper.removeData(key: 'token').then((value) {
          AnimatedDrawerCubit.get(context).closeDrawer();
          Navigator.pushReplacementNamed(context, Routes.loginView);
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            IconBroken.Logout,
            color: Colors.white,
            size: AppConstants.iconSize28,
          ),
          SizedBox(
            width: AppConstants.padding10w,
          ),
          Text(
            'Logout',
            style: AppStyles.textStyle15,
          ),
        ],
      ),
    );
  }
}
