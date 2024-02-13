import 'package:coach_gym_app/presentation/login/login_view.dart';
import 'package:coach_gym_app/presentation/main/tabs_screen.dart';
import 'package:coach_gym_app/presentation/onboarding/view/onboarding_view.dart';
import 'package:coach_gym_app/presentation/welcome/welcome_view.dart';
import 'package:flutter/material.dart';

import '../loading/loading_view.dart';
import '../login_or_create/login_or_create.dart';
import '../main/main_view.dart';
import '../main/pages/excercise_page_details.dart';
import '../main/pages/excercises.dart';
import '../main/pages/progress.dart';
import '../main/pages/settings.dart';
import '../main/pages/workouts.dart';
import '../onboarding_info/onboarding_info_view.dart';
import '../signup/signup_name.dart';
import '../signup/signup_profile.dart';
import 'strings_manager.dart';
import '../signup/code.dart';

class Routes {
  static const String loadingRoute = '/';
  static const String welcomeRoute = '/welcome';
  static const String onBoardingRoute = '/onboarding';
  static const String loginOrCreateRoute = '/loginorcreate';
  static const String loginRoute = '/login';
  static const String signUpRoute = '/signup';
  static const String codeRoute = '/code';
  static const String signupProfileRoute = '/signupprofile';
  static const String onBoardingInfoRoute = '/onboardinginfo';
  static const String mainViewRoute = '/mainView';
  //mainviewpages
  static const String tabsScreenRoute = '/tabsscreen';
  static const String excercisesPageRoute = '/excercisespage';
  static const String excercisePageDetailsRoute = '/excercisepagedetails';
  static const String workoutsPageRoute = '/workoutspage';
  static const String progressPageRoute = '/progresspage';
  static const String settingsPageRoute = '/settingspage';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loadingRoute:
        return MaterialPageRoute(builder: (_) => const LoadingView());
      case Routes.welcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeView());
      case Routes.loginOrCreateRoute:
        return MaterialPageRoute(builder: (_) => const LoginOrCreateView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpNameView());
      case Routes.codeRoute:
        return MaterialPageRoute(builder: (_) => const CodeView());
      case Routes.signupProfileRoute:
        return MaterialPageRoute(builder: (_) => const SignUpProfileView());
      case Routes.onBoardingInfoRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingInfo());
      case Routes.tabsScreenRoute:
        return MaterialPageRoute(builder: (_) => const TabsScreen());

      case Routes.mainViewRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.excercisesPageRoute:
        return MaterialPageRoute(builder: (_) => const ExcercisesPage());
      case Routes.excercisePageDetailsRoute:
        return MaterialPageRoute(builder: (_) => const ExcercisePageDetails());
      case Routes.workoutsPageRoute:
        return MaterialPageRoute(builder: (_) => const WorkoutsPage());
      case Routes.progressPageRoute:
        return MaterialPageRoute(builder: (_) => const ProgressPage());
      case Routes.settingsPageRoute:
        return MaterialPageRoute(builder: (_) => const SettingsPage());

      default:
        return undefiendRoute();
    }
  }

  static Route undefiendRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}



// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_ecommerce_app1/app/di.dart';
// import 'package:flutter_ecommerce_app1/presentation/forget_password/forget_password.dart';
// import 'package:flutter_ecommerce_app1/presentation/main/main_view.dart';
// import 'package:flutter_ecommerce_app1/presentation/onBoarding/view/on_boarding_view.dart';
// import 'package:flutter_ecommerce_app1/presentation/register/view/register_view.dart';
// import 'package:flutter_ecommerce_app1/presentation/store_details/store_details_view.dart';
// import '../login/login_view/login_view.dart';
// import '/presentation/resources/strings_manager.dart';
// import '/presentation/splash/splash_view.dart';

// class Routes {
//   static const String splashRoute = '/';
//   static const String onBoardingRoute = '/onBoarding';
//   static const String loginRoute = '/login';
//   static const String forgetPasswordRoute = '/forgetPassword';
//   static const String registerRoute = '/register';
//   static const String mainRoute = '/main';
//   static const String storeDetailsRoute = '/storeDetails';
// }

// class RouteGenerator {
//   static Route<dynamic> getRoutes(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.splashRoute:
//         return MaterialPageRoute(
//           builder: (_) => const SplashView(),
//         );
//       case Routes.onBoardingRoute:
//         return MaterialPageRoute(builder: (_) => const OnBoardingView());
//       case Routes.loginRoute:
//         initLoginModule();
//         return MaterialPageRoute(builder: (_) => const LoginView());
//       case Routes.forgetPasswordRoute:
//         return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
//       case Routes.registerRoute:
//         initRegisterModule();
//         return MaterialPageRoute(builder: (_) => const RegisterView());
//       case Routes.mainRoute:
//         initHomeModule();
//         return MaterialPageRoute(builder: (_) => const MainView());
//       case Routes.storeDetailsRoute:
//         initStoreDetailsModule();
//         return MaterialPageRoute(builder: (_) => StoreDetailsView());
//       default:
//         return unDefinedRoute();
//     }
//   }

//   static Route<dynamic> unDefinedRoute() {
//     return MaterialPageRoute(
//       builder: (_) => Scaffold(
//         appBar: AppBar(
//           title: const Text(AppStrings.noRouteFound).tr(),
//         ),
//         body: Center(child: const Text(AppStrings.noRouteFound).tr()),
//       ),
//     );
//   }
// }
