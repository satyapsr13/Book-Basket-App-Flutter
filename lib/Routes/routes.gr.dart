// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/foundation.dart' as _i19;
import 'package:flutter/material.dart' as _i18;

import '../Constants/enums.dart' as _i20;
import '../Presentation/Screens/Auth/forgot_access_code_screen.dart' as _i4;
import '../Presentation/Screens/Auth/signin/access_code.dart' as _i12;
import '../Presentation/Screens/Auth/signin/sign_in_with_username.dart' as _i10;
import '../Presentation/Screens/Auth/sinup/basic_info.dart' as _i2;
import '../Presentation/Screens/Auth/sinup/bp_reading.dart' as _i3;
import '../Presentation/Screens/Auth/sinup/medical_history.dart' as _i5;
import '../Presentation/Screens/Auth/sinup/sign_up.dart' as _i11;
import '../Presentation/Screens/Home/home_screen.dart' as _i15;
import '../Presentation/Screens/IntroScreen/onboarding_screen.dart' as _i16;
import '../Presentation/Screens/Reminders/add_reminders.dart' as _i14;
import '../Presentation/Screens/Reminders/reminders.dart' as _i9;
import '../Presentation/Screens/signals_screen.dart' as _i1;
import '../Presentation/Screens/UserDetails/personal_details.dart' as _i13;
import '../Presentation/Screens/UserDetails/pregnancy_details.dart' as _i7;
import '../Presentation/Screens/UserDetails/pregnency_details_edit_screen.dart'
    as _i8;
import '../Presentation/Screens/UserDetails/user_doctor_and_hospital_details.dart'
    as _i6;

class AppRouter extends _i17.RootStackRouter {
  AppRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    SignalScreen.name: (routeData) {
      final args = routeData.argsAs<SignalScreenArgs>();
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.SignalScreen(
              key: args.key, patientStatus: args.patientStatus));
    },
    BasicInfo.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.BasicInfo());
    },
    BPReading.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.BPReading());
    },
    ForgotAccessCodeScreen.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ForgotAccessCodeScreen());
    },
    MedicalHistory.name: (routeData) {
      final args = routeData.argsAs<MedicalHistoryArgs>();
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.MedicalHistory(
              key: args.key,
              bloodGroup: args.bloodGroup,
              weight: args.weight,
              height: args.height,
              state: args.state,
              city: args.city));
    },
    UserDoctorAndHospitalScreen.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.UserDoctorAndHospitalScreen());
    },
    PregnancyDetails.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.PregnancyDetails());
    },
    PregnancyDetailsEditScreen.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.PregnancyDetailsEditScreen());
    },
    RemindersScreen.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.RemindersScreen());
    },
    SignInWithUserName.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.SignInWithUserName());
    },
    SignUpScreen.name: (routeData) {
      final args = routeData.argsAs<SignUpScreenArgs>(
          orElse: () => const SignUpScreenArgs());
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.SignUpScreen(key: args.key, accessCode: args.accessCode));
    },
    AccessCodeScreen.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.AccessCodeScreen());
    },
    PersonalDetailsScreen.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.PersonalDetailsScreen());
    },
    AddRemindersScreen.name: (routeData) {
      final args = routeData.argsAs<AddRemindersScreenArgs>(
          orElse: () => const AddRemindersScreenArgs());
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.AddRemindersScreen(
              key: args.key, hour: args.hour, minute: args.minute));
    },
    HomeScreen.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.HomeScreen());
    },
    OnBoardingScreen.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.OnBoardingScreen());
    }
  };

  @override
  List<_i17.RouteConfig> get routes => [
        _i17.RouteConfig(SignalScreen.name, path: '/signal-screen'),
        _i17.RouteConfig(BasicInfo.name, path: '/basic-info'),
        _i17.RouteConfig(BPReading.name, path: '/b-pReading'),
        _i17.RouteConfig(ForgotAccessCodeScreen.name,
            path: '/forgot-access-code-screen'),
        _i17.RouteConfig(MedicalHistory.name, path: '/medical-history'),
        _i17.RouteConfig(UserDoctorAndHospitalScreen.name,
            path: '/user-doctor-and-hospital-screen'),
        _i17.RouteConfig(PregnancyDetails.name, path: '/pregnancy-details'),
        _i17.RouteConfig(PregnancyDetailsEditScreen.name,
            path: '/pregnancy-details-edit-screen'),
        _i17.RouteConfig(RemindersScreen.name, path: '/reminders-screen'),
        _i17.RouteConfig(BasicInfo.name, path: '/basic-info'),
        _i17.RouteConfig(BPReading.name, path: '/b-pReading'),
        _i17.RouteConfig(MedicalHistory.name, path: '/medical-history'),
        _i17.RouteConfig(SignInWithUserName.name,
            path: '/sign-in-with-user-name'),
        _i17.RouteConfig(SignUpScreen.name, path: '/sign-up-screen'),
        _i17.RouteConfig(AccessCodeScreen.name, path: '/access-code-screen'),
        _i17.RouteConfig(PersonalDetailsScreen.name,
            path: '/personal-details-screen'),
        _i17.RouteConfig(AddRemindersScreen.name,
            path: '/add-reminders-screen'),
        _i17.RouteConfig(HomeScreen.name, path: '/home-screen'),
        _i17.RouteConfig(OnBoardingScreen.name, path: '/on-boarding-screen')
      ];
}

/// generated route for
/// [_i1.SignalScreen]
class SignalScreen extends _i17.PageRouteInfo<SignalScreenArgs> {
  SignalScreen({_i19.Key? key, required _i20.PatientStatus patientStatus})
      : super(SignalScreen.name,
            path: '/signal-screen',
            args: SignalScreenArgs(key: key, patientStatus: patientStatus));

  static const String name = 'SignalScreen';
}

class SignalScreenArgs {
  const SignalScreenArgs({this.key, required this.patientStatus});

  final _i19.Key? key;

  final _i20.PatientStatus patientStatus;

  @override
  String toString() {
    return 'SignalScreenArgs{key: $key, patientStatus: $patientStatus}';
  }
}

/// generated route for
/// [_i2.BasicInfo]
class BasicInfo extends _i17.PageRouteInfo<void> {
  const BasicInfo() : super(BasicInfo.name, path: '/basic-info');

  static const String name = 'BasicInfo';
}

/// generated route for
/// [_i3.BPReading]
class BPReading extends _i17.PageRouteInfo<void> {
  const BPReading() : super(BPReading.name, path: '/b-pReading');

  static const String name = 'BPReading';
}

/// generated route for
/// [_i4.ForgotAccessCodeScreen]
class ForgotAccessCodeScreen extends _i17.PageRouteInfo<void> {
  const ForgotAccessCodeScreen()
      : super(ForgotAccessCodeScreen.name, path: '/forgot-access-code-screen');

  static const String name = 'ForgotAccessCodeScreen';
}

/// generated route for
/// [_i5.MedicalHistory]
class MedicalHistory extends _i17.PageRouteInfo<MedicalHistoryArgs> {
  MedicalHistory(
      {_i19.Key? key,
      required String bloodGroup,
      required String weight,
      required String height,
      required String state,
      required String city})
      : super(MedicalHistory.name,
            path: '/medical-history',
            args: MedicalHistoryArgs(
                key: key,
                bloodGroup: bloodGroup,
                weight: weight,
                height: height,
                state: state,
                city: city));

  static const String name = 'MedicalHistory';
}

class MedicalHistoryArgs {
  const MedicalHistoryArgs(
      {this.key,
      required this.bloodGroup,
      required this.weight,
      required this.height,
      required this.state,
      required this.city});

  final _i19.Key? key;

  final String bloodGroup;

  final String weight;

  final String height;

  final String state;

  final String city;

  @override
  String toString() {
    return 'MedicalHistoryArgs{key: $key, bloodGroup: $bloodGroup, weight: $weight, height: $height, state: $state, city: $city}';
  }
}

/// generated route for
/// [_i6.UserDoctorAndHospitalScreen]
class UserDoctorAndHospitalScreen extends _i17.PageRouteInfo<void> {
  const UserDoctorAndHospitalScreen()
      : super(UserDoctorAndHospitalScreen.name,
            path: '/user-doctor-and-hospital-screen');

  static const String name = 'UserDoctorAndHospitalScreen';
}

/// generated route for
/// [_i7.PregnancyDetails]
class PregnancyDetails extends _i17.PageRouteInfo<void> {
  const PregnancyDetails()
      : super(PregnancyDetails.name, path: '/pregnancy-details');

  static const String name = 'PregnancyDetails';
}

/// generated route for
/// [_i8.PregnancyDetailsEditScreen]
class PregnancyDetailsEditScreen extends _i17.PageRouteInfo<void> {
  const PregnancyDetailsEditScreen()
      : super(PregnancyDetailsEditScreen.name,
            path: '/pregnancy-details-edit-screen');

  static const String name = 'PregnancyDetailsEditScreen';
}

/// generated route for
/// [_i9.RemindersScreen]
class RemindersScreen extends _i17.PageRouteInfo<void> {
  const RemindersScreen()
      : super(RemindersScreen.name, path: '/reminders-screen');

  static const String name = 'RemindersScreen';
}

/// generated route for
/// [_i10.SignInWithUserName]
class SignInWithUserName extends _i17.PageRouteInfo<void> {
  const SignInWithUserName()
      : super(SignInWithUserName.name, path: '/sign-in-with-user-name');

  static const String name = 'SignInWithUserName';
}

/// generated route for
/// [_i11.SignUpScreen]
class SignUpScreen extends _i17.PageRouteInfo<SignUpScreenArgs> {
  SignUpScreen({_i19.Key? key, String? accessCode})
      : super(SignUpScreen.name,
            path: '/sign-up-screen',
            args: SignUpScreenArgs(key: key, accessCode: accessCode));

  static const String name = 'SignUpScreen';
}

class SignUpScreenArgs {
  const SignUpScreenArgs({this.key, this.accessCode});

  final _i19.Key? key;

  final String? accessCode;

  @override
  String toString() {
    return 'SignUpScreenArgs{key: $key, accessCode: $accessCode}';
  }
}

/// generated route for
/// [_i12.AccessCodeScreen]
class AccessCodeScreen extends _i17.PageRouteInfo<void> {
  const AccessCodeScreen()
      : super(AccessCodeScreen.name, path: '/access-code-screen');

  static const String name = 'AccessCodeScreen';
}

/// generated route for
/// [_i13.PersonalDetailsScreen]
class PersonalDetailsScreen extends _i17.PageRouteInfo<void> {
  const PersonalDetailsScreen()
      : super(PersonalDetailsScreen.name, path: '/personal-details-screen');

  static const String name = 'PersonalDetailsScreen';
}

/// generated route for
/// [_i14.AddRemindersScreen]
class AddRemindersScreen extends _i17.PageRouteInfo<AddRemindersScreenArgs> {
  AddRemindersScreen({_i19.Key? key, int hour = 10, int minute = 10})
      : super(AddRemindersScreen.name,
            path: '/add-reminders-screen',
            args: AddRemindersScreenArgs(key: key, hour: hour, minute: minute));

  static const String name = 'AddRemindersScreen';
}

class AddRemindersScreenArgs {
  const AddRemindersScreenArgs({this.key, this.hour = 10, this.minute = 10});

  final _i19.Key? key;

  final int hour;

  final int minute;

  @override
  String toString() {
    return 'AddRemindersScreenArgs{key: $key, hour: $hour, minute: $minute}';
  }
}

/// generated route for
/// [_i15.HomeScreen]
class HomeScreen extends _i17.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '/home-screen');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i16.OnBoardingScreen]
class OnBoardingScreen extends _i17.PageRouteInfo<void> {
  const OnBoardingScreen()
      : super(OnBoardingScreen.name, path: '/on-boarding-screen');

  static const String name = 'OnBoardingScreen';
}
