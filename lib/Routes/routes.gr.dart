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
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../Presentation/Screens/IntroScreen/onboarding_screen.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    OnboardingScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.OnboardingScreen());
    }
  };

  @override
  List<_i2.RouteConfig> get routes =>
      [_i2.RouteConfig(OnboardingScreen.name, path: '/onboarding-screen')];
}

/// generated route for
/// [_i1.OnboardingScreen]
class OnboardingScreen extends _i2.PageRouteInfo<void> {
  const OnboardingScreen()
      : super(OnboardingScreen.name, path: '/onboarding-screen');

  static const String name = 'OnboardingScreen';
}
