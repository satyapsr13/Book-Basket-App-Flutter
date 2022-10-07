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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../Presentation/Screens/Auth/log_in.dart' as _i3;
import '../Presentation/Screens/Auth/sign_up.dart' as _i2;
import '../Presentation/Screens/Books/book_selling_form_screen.dart' as _i6;
import '../Presentation/Screens/Books/books_details_screen.dart' as _i5;
import '../Presentation/Screens/Cart/cart_screen.dart' as _i7;
import '../Presentation/Screens/Home/home_screen.dart' as _i4;
import '../Presentation/Screens/IntroScreen/onboarding_screen.dart' as _i1;
import '../Presentation/Screens/IntroScreen/splash_screen.dart' as _i9;
import '../Presentation/Screens/Profile/user_profile_screen.dart' as _i8;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    OnboardingScreen.name: (routeData) {
      final args = routeData.argsAs<OnboardingScreenArgs>(
          orElse: () => const OnboardingScreenArgs());
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.OnboardingScreen(key: args.key));
    },
    SignUpScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignUpScreen());
    },
    LoginScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginScreen());
    },
    HomeScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomeScreen());
    },
    BookDetailsScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.BookDetailsScreen());
    },
    BookDetailsFormScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.BookDetailsFormScreen());
    },
    CartScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.CartScreen());
    },
    UserProfileScreen.name: (routeData) {
      final args = routeData.argsAs<UserProfileScreenArgs>(
          orElse: () => const UserProfileScreenArgs());
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.UserProfileScreen(key: args.key));
    },
    SplashScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.SplashScreen());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(OnboardingScreen.name, path: '/onboarding-screen'),
        _i10.RouteConfig(SignUpScreen.name, path: '/sign-up-screen'),
        _i10.RouteConfig(LoginScreen.name, path: '/login-screen'),
        _i10.RouteConfig(HomeScreen.name, path: '/home-screen'),
        _i10.RouteConfig(BookDetailsScreen.name, path: '/book-details-screen'),
        _i10.RouteConfig(BookDetailsFormScreen.name,
            path: '/book-details-form-screen'),
        _i10.RouteConfig(CartScreen.name, path: '/cart-screen'),
        _i10.RouteConfig(UserProfileScreen.name, path: '/user-profile-screen'),
        _i10.RouteConfig(SplashScreen.name, path: '/splash-screen')
      ];
}

/// generated route for
/// [_i1.OnboardingScreen]
class OnboardingScreen extends _i10.PageRouteInfo<OnboardingScreenArgs> {
  OnboardingScreen({_i11.Key? key})
      : super(OnboardingScreen.name,
            path: '/onboarding-screen', args: OnboardingScreenArgs(key: key));

  static const String name = 'OnboardingScreen';
}

class OnboardingScreenArgs {
  const OnboardingScreenArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'OnboardingScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.SignUpScreen]
class SignUpScreen extends _i10.PageRouteInfo<void> {
  const SignUpScreen() : super(SignUpScreen.name, path: '/sign-up-screen');

  static const String name = 'SignUpScreen';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreen extends _i10.PageRouteInfo<void> {
  const LoginScreen() : super(LoginScreen.name, path: '/login-screen');

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreen extends _i10.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '/home-screen');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i5.BookDetailsScreen]
class BookDetailsScreen extends _i10.PageRouteInfo<void> {
  const BookDetailsScreen()
      : super(BookDetailsScreen.name, path: '/book-details-screen');

  static const String name = 'BookDetailsScreen';
}

/// generated route for
/// [_i6.BookDetailsFormScreen]
class BookDetailsFormScreen extends _i10.PageRouteInfo<void> {
  const BookDetailsFormScreen()
      : super(BookDetailsFormScreen.name, path: '/book-details-form-screen');

  static const String name = 'BookDetailsFormScreen';
}

/// generated route for
/// [_i7.CartScreen]
class CartScreen extends _i10.PageRouteInfo<void> {
  const CartScreen() : super(CartScreen.name, path: '/cart-screen');

  static const String name = 'CartScreen';
}

/// generated route for
/// [_i8.UserProfileScreen]
class UserProfileScreen extends _i10.PageRouteInfo<UserProfileScreenArgs> {
  UserProfileScreen({_i11.Key? key})
      : super(UserProfileScreen.name,
            path: '/user-profile-screen',
            args: UserProfileScreenArgs(key: key));

  static const String name = 'UserProfileScreen';
}

class UserProfileScreenArgs {
  const UserProfileScreenArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'UserProfileScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.SplashScreen]
class SplashScreen extends _i10.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/splash-screen');

  static const String name = 'SplashScreen';
}
