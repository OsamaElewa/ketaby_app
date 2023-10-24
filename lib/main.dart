import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/core/api/api_services_implementation.dart';
import 'package:ketaby/features/books_view/data/repository/add_to_fav_repository_implementation.dart';
import 'package:ketaby/features/books_view/data/repository/book_repository_implementation.dart';
import 'package:ketaby/features/books_view/presentation/cubits/add_to_cubit.dart';
import 'package:ketaby/features/books_view/presentation/cubits/book_cubit.dart';
import 'package:ketaby/features/cart_view/data/repository/cart_repository_implementation.dart';
import 'package:ketaby/features/cart_view/presentation/cubits/cart_cubit.dart';
import 'package:ketaby/features/check_out_view/data/repository/governorates_repository/governorates_repository_implementation.dart';
import 'package:ketaby/features/check_out_view/data/repository/order_repository/order_repository_implementation.dart';
import 'package:ketaby/features/check_out_view/presentation/cubits/governorates_cubit/governorates_cubit.dart';
import 'package:ketaby/features/check_out_view/presentation/cubits/order_cubit/order_cubit.dart';

import 'package:ketaby/features/home/data/repository/best_seller_repository/best_seller_repository_implementation.dart';
import 'package:ketaby/features/home/data/repository/category_repository/category_repository_implementation.dart';
import 'package:ketaby/features/home/data/repository/new_arrival_repository/new_arrival_repository_implementation.dart';
import 'package:ketaby/features/home/data/repository/slider_repository/slider_repository_implementation.dart';
import 'package:ketaby/features/home/presentation/cubits/best_seller_cubit/best_seller_cubit.dart';
import 'package:ketaby/features/home/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:ketaby/features/home/presentation/cubits/new_arrival_cubit/new_arrival_cubit.dart';
import 'package:ketaby/features/home/presentation/cubits/slider_cubit/slider_cubit.dart';
import 'package:ketaby/features/layout/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';


import 'config/local/cache_helper.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_constants.dart';
import 'features/bloc_observer.dart';
import 'features/profilee/data/repository/profile_repository_implementation.dart';
import 'features/profilee/presentation/cubits/get_user_profile_cubit/get_user_profile_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer=MyBlocObserver();
  AppConstants.token = CacheHelper.getString(key: 'token') ?? '';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AnimatedDrawerCubit(),),
            BlocProvider(
              create:(context) => SliderCubit(SliderRepositoryImplementation(ApiServicesImplementation()))..getSlider()),
            BlocProvider(
              create: (context) => BestSellerCubit(BestSellerRepositoryImplementation(ApiServicesImplementation()))..getBestSeller(),),
            BlocProvider(
              create: (context) => CategoryCubit(CategoryRepositoryImplementation(ApiServicesImplementation()))..getCategory(),),
            BlocProvider(
              create: (context) => NewArrivalCubit(NewArrivalRepositoryImplementation(ApiServicesImplementation()))..getNewArrival(),),
            BlocProvider(
              create: (context) => NewArrivalCubit(NewArrivalRepositoryImplementation(ApiServicesImplementation()))..getNewArrival(),),
            BlocProvider(
              create: (context) => BookCubit(BookRepositoryImplementation(ApiServicesImplementation()))..getBook(),),
            BlocProvider(
              create: (context) => GetUserProfileCubit(ProfileRepositoryImplementation(ApiServicesImplementation()))..getUserProfile(),),
            BlocProvider(
              create: (context) => CartCubit(CartRepositoryImplementation(ApiServicesImplementation()))),
            BlocProvider(
              create: (context) => GovernoratesCubit(GovernoratesRepositoryImplementation(ApiServicesImplementation()))..getGovernorates(),),
            // BlocProvider(
            //   create: (context) => CheckOutCubit(CheckOutRepositoryImplementation(ApiServicesImplementation()))..getCheckOut(),),
            BlocProvider(
              create: (context) => OrderCubit(OrderRepositoryImplementation(ApiServicesImplementation())),),
            // BlocProvider(
            //   create: (context) => HistoryCubit(HistoryRepositoryImplementation(ApiServicesImplementation()))..getHistory(),),
            BlocProvider(
              create: (context) => AddToCubit(AddToFavRepositoryImplementation(ApiServicesImplementation())),),
          ],
          child: MaterialApp(
            title: 'Tasks',
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            onGenerateRoute: AppRoutes.generateRoute,
          ),
        );
      },
    );
  }
}