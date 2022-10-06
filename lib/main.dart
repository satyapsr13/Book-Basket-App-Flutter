// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable, must_be_immutable
//https://picsum.photos/200/300   //  ⌘ ñ
import 'package:book_basket/Data/services/secure_storage.dart';
import 'package:book_basket/Logic/block_provider.dart';
import 'package:book_basket/Routes/routes.gr.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:path_provider/path_provider.dart';

// run below command to generate Routes dart file
// flutter packages pub run build_runner watch

Future<void> main() async {
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  //   systemNavigationBarColor: Colors.transparent,
  // ));
  WidgetsFlutterBinding.ensureInitialized();
  // AwesomeNotifications().initialize(
  //   'resource://drawable/logo',
  //   [
  //     NotificationChannel(
  //       // channelGroupKey: 'basic_channel_group',
  //       channelKey: 'basic_channel',
  //       channelName: 'Basic notifications',
  //       channelDescription: 'Notification channel for basic tests',
  //       defaultColor: Color.fromARGB(255, 80, 221, 216),
  //       ledColor: Colors.amber,
  //       importance: NotificationImportance.High,
  //       channelShowBadge: true,
  //     ),
  //     NotificationChannel(
  //       // channelGroupKey: 'basic_channel_group',
  //       channelKey: 'scheduled_channel',
  //       channelName: 'Schedule notifications NHS',
  //       channelDescription: 'Notification channel for basic tests',
  //       defaultColor: Color.fromARGB(255, 80, 221, 216),
  //       // ledColor: Colors.white,
  //       importance: NotificationImportance.High,
  //       locked: true,
  //       channelShowBadge: true,
  //     )
  //   ],
  //   // Channel groups are only visual and are not required
  //   // channelGroups: [
  //   //   NotificationChannelGroup(
  //   //       channelGroupkey: 'basic_channel_group',
  //   //       channelGroupName: 'Basic group')
  //   // ],
  //   debug: false,
  // );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await EasyLocalization.ensureInitialized();
  // checking login status
  final secureStorage = SecureStorage();

  bool isLoggedIn = await secureStorage.hasToken();

  // hydrated storage is persisted across app restarts
  final HydratedStorage hydratedStorage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  var blocProviders = await getBlocProviders(secureStorage, hydratedStorage);

  HydratedBlocOverrides.runZoned(
      () => runApp(
            EasyLocalization(
              path: 'assets/translations',
              supportedLocales: const [
                Locale('en'),
                // Locale('fil'),
                // Locale('fil', 'ph')
              ],
              fallbackLocale: const Locale('en'),
              useFallbackTranslations: true,
              child: MyApp(
                blocProviders: blocProviders,
                isLoggedIn: isLoggedIn,
              ),
            ),
          ),
      storage: hydratedStorage);
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  final List<BlocProvider> blocProviders;
  bool isLoggedIn;

// final storage = await HydratedStorage.build();
  MyApp({
    Key? key,
    required this.blocProviders,
    required this.isLoggedIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp.router(
        // theme: appThemeData[AppTheme.lightTheme],
        theme: ThemeData(primaryColor: const Color(0xff23A6B1)),

        title: 'Book Basket',
        supportedLocales: context.supportedLocales,

        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(
            // initialRoutes: [isLoggedIn ? HomeScreen() : OnboardingScreen()]),
            initialRoutes: [CartScreen()]),

        routeInformationParser:
            _appRouter.defaultRouteParser(includePrefixMatches: true),
        // _appRouter.
        //routes: {  targetscreen.routeName:(ctx)=>const targetscreen(),},
      ),
    );
  }
}
