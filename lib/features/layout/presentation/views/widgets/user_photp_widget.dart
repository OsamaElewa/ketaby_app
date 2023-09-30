import 'package:flutter/material.dart';


import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_strings.dart';

class UserPhotoWidget extends StatelessWidget {
  const UserPhotoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: AppConstants.radius30sp,
      child: CircleAvatar(
        radius: AppConstants.radius28sp,
        child: Image.asset(
          'assets/images/user.png',
        ),
      ),
    );
  }
}
