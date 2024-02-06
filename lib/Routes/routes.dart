import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../Presentation/Screens/Auth/log_in.dart';
import '../Presentation/Screens/Auth/sign_up.dart';
import '../Presentation/Screens/Auth/sign_up_form.dart';
import '../Presentation/Screens/Books/book_selling_form_screen.dart';
import '../Presentation/Screens/Books/books_details_screen.dart';
import '../Presentation/Screens/Cart/cart_screen.dart';
import '../Presentation/Screens/Home/home_screen.dart';
import '../Presentation/Screens/IntroScreen/onboarding_screen.dart';
import '../Presentation/Screens/IntroScreen/splash_screen.dart';
import '../Presentation/Screens/Profile/user_profile_screen.dart';
part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // add your routes here
      ];
}
