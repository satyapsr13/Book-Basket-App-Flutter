// ignore_for_file: prefer_const_constructors
import 'package:auto_route/auto_route.dart';
import 'package:book_basket/Presentation/Widgets/coming_soon_label.dart';
import 'package:book_basket/Routes/routes.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../Screens/Home/home_screen.dart';
// import 'package:semikolan_app/Routes/routes.gr.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return FloatingNavbar(
      onTap: (int val) {
        switch (val) {
          case 0:
            currentIndex == val ? null : context.pushRoute(HomeRoute());

            break;
          case 1:
            // context.pushRoute(IntrestScreen());

            break;
          case 2:
            currentIndex == val ? null : context.pushRoute(UserProfileRoute());

            break;
          case 3:
            currentIndex == val ? null : context.pushRoute(CartRoute());

            break;
          default:
            currentIndex == val ? null : context.pushRoute(HomeRoute());
        } //returns tab id which is user tapped
      },
      backgroundColor: Colors.white,
      unselectedItemColor: Color(0xff0A192F).withOpacity(0.7),
      currentIndex: currentIndex,
      items: [
        FloatingNavbarItem(icon: Icons.home, title: 'Home'),
        FloatingNavbarItem(
          icon: Icons.message_rounded,
          title: 'Chats',
          customWidget: CommingSoonLabel(
            child: Icon(
              Icons.message_rounded,
              color: Color(0xff0A192F).withOpacity(0.4),
            ),
          ),
        ),
        FloatingNavbarItem(
          icon: Icons.person,
          title: 'Profile',
        ),
        FloatingNavbarItem(icon: Icons.shopping_bag, title: 'Cart'),
      ],
    );
  }
}
