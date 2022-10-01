import 'package:auto_route/auto_route.dart';
import 'package:book_basket/Presentation/Screens/IntroScreen/onboarding_screen.dart';
// ignore_for_file: prefer_const_constructors
// @AdaptiveAutoRouter(
//   replaceInRouteName: 'Page,Route',

//   //  bool isLoggedIn = await secureStorage.hasToken();
//   routes: <AutoRoute>[
//     AutoRoute(page: OnBoardingScreen, initial: true),
//     AutoRoute(page: HomeScreen),
//     AutoRoute(page: HomeScreen, children: []),
//     AutoRoute(page: BasicInfo),
//     AutoRoute(page: SignalScreen),
//     AutoRoute(page: SignUpScreen),
//     AutoRoute(page: SignInWithUserName),
//     AutoRoute(page: AccessCodeScreen),
//     AutoRoute(page: BPReading),
//     AutoRoute(page: MedicalHistory),
//     // AutoRoute(page: SignInWithUserName),
//     AutoRoute(page: PregnancyDetails),
//     AutoRoute(page: PregnancyDetailsEditScreen),
//     AutoRoute(page: AddRemindersScreen),
//     AutoRoute(page: RemindersScreen),
//     AutoRoute(page: PersonalDetailsScreen),
//     AutoRoute(
//         path: "/login",
//         page: SignInWithUserName, // we'll get to this LoginWrapperPage next
//         children: [
//           // AutoRoute(page: EmailPage),
//           // AutoRoute(page: PasswordPage),
//         ]),
//   ],
// )
// class $AppRouter {}

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // our new login routes are defined here!
    AutoRoute(page: OnboardingScreen),
    // AutoRoute(page: SignalScreen),
    // AutoRoute(page: BasicInfo),
    // AutoRoute(page: BPReading),
    // AutoRoute(page: ForgotAccessCodeScreen),
    // AutoRoute(page: MedicalHistory),
    // AutoRoute(page: UserDoctorAndHospitalScreen),
    // // // AutoRoute(page: SignInWithUserName),
    // AutoRoute(page: PregnancyDetails),
    // AutoRoute(page: PregnancyDetailsEditScreen),
    // AutoRoute(page: RemindersScreen),
    // AutoRoute(page: BasicInfo),
    // AutoRoute(page: BPReading),
    // AutoRoute(page: MedicalHistory),

    // AutoRoute(page: SignInWithUserName),
    // AutoRoute(page: SignUpScreen),
    // AutoRoute(page: AccessCodeScreen),

    // AutoRoute(page: PersonalDetailsScreen),
    // AutoRoute(page: AddRemindersScreen),
    // AutoRoute(page: HomeScreen),
    // AutoRoute(page: OnBoardingScreen),
  ],
)
class $AppRouter {}
