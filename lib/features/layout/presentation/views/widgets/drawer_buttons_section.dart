import 'package:flutter/material.dart';
import 'package:ketaby/features/books_view/presentation/views/books_view.dart';
import 'package:ketaby/features/cart_view/presentation/views/cart_view.dart';
import 'package:ketaby/features/favorite_view/presentation/views/favorite_view.dart';
import 'package:ketaby/features/history_view/presentation/views/history_view.dart';

import '../../../../../config/icons/icons_broken.dart';
import '../../../../profile/presentation/views/profile_view.dart';
import '../../cubits/animated_drawer_cubit/animated_drawer_cubit.dart';
import 'drawer_buttons_section_item.dart';

class DrawerButtonsSection extends StatelessWidget {
  const DrawerButtonsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrawerButtonsSectionItem(
          title: 'Home',
          icon: IconBroken.Home,
          onTap: () {
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: 'Books',
          icon: IconBroken.Bookmark,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return  BooksView();
              },
            ));
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: 'Favourite',
          icon: IconBroken.Heart,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const FavoriteView();
              },
            ));
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: 'Cart',
          icon: IconBroken.Buy,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const CartView();
              },
            ));
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: 'History',
          icon: Icons.history,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const HistoryView();
              },
            ));
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: 'Profile',
          icon: IconBroken.Profile,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const ProfileView();
              },
            ));
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
      ],
    );
  }
}
