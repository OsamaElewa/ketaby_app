import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/features/layout/presentation/views/animated_drawer_view.dart';

import '../../core/animations/page_fade_transition.dart';
import '../../core/animations/page_slide_transition.dart';
import '../../core/api/api_services_implementation.dart';
import '../../core/utils/app_strings.dart';
import '../../features/authentication/data/repository/authentication_repository_implementation.dart';
import '../../features/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import '../../features/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import '../../features/authentication/presentation/views/login_view.dart';
import '../../features/authentication/presentation/views/register_view.dart';
import '../../features/cart_view/data/repository/cart_repository_implementation.dart';
import '../../features/cart_view/presentation/cubits/remove_from_cart_cubit/remove_from_cart_cubit.dart';
import '../../features/cart_view/presentation/cubits/update_cart_cubit/update_cart_cubit.dart';
import '../../features/cart_view/presentation/views/cart_view.dart';
import '../../features/onboarding/presentation/cubit/onboarding_cubit.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/profile/data/model/profile_model.dart';
import '../../features/profile/data/repository/profile_repository_implementation.dart';
import '../../features/profile/presentation/cubits/update_user_profile_cubit/update_user_profile_cubit.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/profile/presentation/views/update_profile_view.dart';

import '../../features/splash/presentation/views/splash_view.dart';


class Routes {
  static const String slashView = '/';
  static const String onBoardingView = '/onBoarding_view';
  static const String registerView = '/register_view';
  static const String loginView = '/login_view';
  static const String layoutView = '/layout_view';
  static const String bookView = '/book_view';
  static const String cartView = '/cart_view';
  static const String profileView = '/profile_view';
  static const String updateProfileView = '/update_profile_view';
  static const String doctorDetailsView = '/doctor_details_view';
  static const String specializationView = '/specialization_view';
  static const String searchView = '/search_view';
  static const String appointmentDetailsView = '/appointment_detail_view';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.slashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.onBoardingView:
        return PageFadeTransition(
          page: BlocProvider(
            create: (context) => OnBoardingCubit(),
            child: const OnBoardingView(),
          ),
        );
      case Routes.loginView:
        return PageFadeTransition(
          page: BlocProvider(
            create: (context) => LoginCubit(
                AuthenticationRepositoryImplementation(
                    ApiServicesImplementation())),
            child: const LoginView(),
          ),
        );
      case Routes.registerView:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: BlocProvider(
            create: (context) => RegisterCubit(
                AuthenticationRepositoryImplementation(
                    ApiServicesImplementation())),
            child: const RegisterView(),
          ),
        );
      case Routes.layoutView:
        return PageFadeTransition(
          page: const AnimatedDrawerView(),
        );
      case Routes.cartView:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) =>
                  UpdateCartCubit(
                    CartRepositoryImplementation(ApiServicesImplementation()),
                  ),
            ),
            BlocProvider(
              create: (context) =>
                  RemoveFromCartCubit(
                    CartRepositoryImplementation(ApiServicesImplementation()),
                  ),
            ),
          ], child: const CartView()),
        );
      case Routes.profileView:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: const ProfileView(),
        );
      case Routes.updateProfileView:
        final profileModel = settings.arguments as ProfileModel;
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: BlocProvider(
              create: (context) =>
                  UpdateUserProfileCubit(
                      ProfileRepositoryImplementation(ApiServicesImplementation())),
              child: UpdateProfileView(profileModel: profileModel,)),
        );
    }
    return undefinedRoute();
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          )),
    );
  }
}
