import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';


class ImageUserProfile extends StatelessWidget {
  const ImageUserProfile({Key? key, required this.image}) : super(key: key);
final String image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 80,
        backgroundColor: AppColors.indigo,
        child: CircleAvatar(
          radius: 76,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 72,
            backgroundImage: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}