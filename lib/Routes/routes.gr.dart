// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../Presentation/Screens/Auth/log_in.dart' as _i3;
import '../Presentation/Screens/Auth/sign_up.dart' as _i2;
import '../Presentation/Screens/Home/home_screen.dart' as _i4;
import '../Presentation/Screens/IntroScreen/onboarding_screen.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    OnboardingScreen.name: (routeData) {
      final args = routeData.argsAs<OnboardingScreenArgs>(
          orElse: () => const OnboardingScreenArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.OnboardingScreen(key: args.key));
    },
    SignUpScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignUpScreen());
    },
    LoginScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginScreen());
    },
    HomeScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomeScreen());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(OnboardingScreen.name, path: '/onboarding-screen'),
        _i5.RouteConfig(SignUpScreen.name, path: '/sign-up-screen'),
        _i5.RouteConfig(LoginScreen.name, path: '/login-screen'),
        _i5.RouteConfig(HomeScreen.name, path: '/home-screen')
      ];
}

/// generated route for
/// [_i1.OnboardingScreen]
class OnboardingScreen extends _i5.PageRouteInfo<OnboardingScreenArgs> {
  OnboardingScreen({_i6.Key? key})
      : super(OnboardingScreen.name,
            path: '/onboarding-screen', args: OnboardingScreenArgs(key: key));

  static const String name = 'OnboardingScreen';
}

class OnboardingScreenArgs {
  const OnboardingScreenArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'OnboardingScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.SignUpScreen]
class SignUpScreen extends _i5.PageRouteInfo<void> {
  const SignUpScreen() : super(SignUpScreen.name, path: '/sign-up-screen');

  static const String name = 'SignUpScreen';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreen extends _i5.PageRouteInfo<void> {
  const LoginScreen() : super(LoginScreen.name, path: '/login-screen');

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreen extends _i5.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '/home-screen');

  static const String name = 'HomeScreen';
}
