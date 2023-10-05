import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/features/home/presentation/views/widgets/best_seller_widget/best_seller_list_view.dart';
import 'package:ketaby/features/home/presentation/views/widgets/slider_section.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import 'category_widget/category_list_view.dart';
import 'new_arrival_widget/new_arrival_list_view.dart';


List<String> banners = [
  'assets/images/user.png',
  'assets/images/user.png',
  'assets/images/user.png',
  'assets/images/user.png',
  'assets/images/user.png',
];

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
              },
              child: const CustomAppBar(
                isUser: true,
                rightWidget: Text(''),
              ),
            ),
            const SizedBox(height: 10,),
              Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const SliderSection(),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Best Seller',style: AppStyles.textStyle20),
                      IconButton(
                          onPressed: (){},
                          icon:const Icon( IconBroken.Arrow___Right))
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const BestSellerListView(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Categories',style: AppStyles.textStyle20),
                      IconButton(
                          onPressed: (){},
                          icon:const Icon( IconBroken.Arrow___Right))
                    ],
                  ),
                  const CategoryListView(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('New Arrival',style: AppStyles.textStyle20),
                      IconButton(
                          onPressed: (){},
                          icon:const Icon( IconBroken.Arrow___Right))
                    ],
                  ),
                  const NewArrivalListView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
