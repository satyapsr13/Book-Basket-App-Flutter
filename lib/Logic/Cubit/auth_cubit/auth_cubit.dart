import 'dart:async';
import 'dart:convert';
import 'dart:developer';

// import 'dart:convert';

import 'package:book_basket/Constants/enums.dart';
import 'package:book_basket/Data/repositories/auth_repositories.dart';
import 'package:book_basket/Data/services/api_result.dart';
import 'package:book_basket/Data/services/network_exceptions.dart';
import 'package:book_basket/Data/services/secure_storage.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  final SecureStorage secureStorage;
  final AuthRepository authRepository;

  // final LocaleCubit localeCubit;
  AuthCubit({
    required this.secureStorage,
    required this.authRepository,
    // required this.localeCubit,
  }) : super(const AuthState(status: Status.initial));

  void sinupUser(
      String userName,
      String firstName,
      String lastName,
      String dateofBirth,
      String password,
      String accessCode,
      String mobileNumber) async {
    emit(state.copyWith(status: Status.loading));
    ApiResult<dynamic> sinupResponse = await authRepository.SinupUser(userName,
        firstName, lastName, dateofBirth, password, accessCode, mobileNumber);
    sinupResponse.when(success: (dynamic response) {
      secureStorage.writeToLocalStorage('TOKEN', response["token"].toString());
      Timer(const Duration(seconds: 2), () {
        emit(state.copyWith(
          status: Status.success,
        ));
        log("********************[RECEIVED TOKEN]->   ${response["token"].toString()}  ");
      });
      // const secureStorage = FlutterSecureStorage();
      // secureStorage.write(key: "TOKEN", value: response["token"].toString());
    }, failure: (NetworkExceptions error) {
      emit(state.copyWith(
        status: Status.failure,
        message: NetworkExceptions.getErrorMessage(error),
      ));
    });
  }

  void loginUser(String userName, String password) async {
    emit(state.copyWith(status: Status.loading));

    ApiResult<dynamic> sinupResponse =
        await authRepository.LoginUser(userName, password);

    sinupResponse.when(success: (dynamic response) {
      emit(state.copyWith(
        status: Status.success,
      ));
      log("********************[RECEIVED TOKEN]->   ${response["data"]["token"].toString()}  ");
      // const secureStorage = FlutterSecureStorage();
      // secureStorage.write(
      //     key: "TOKEN", value: response["data"]["token"].toString());
      secureStorage.writeToLocalStorage(
          "TOKEN", response["data"]["token"].toString());
    }, failure: (NetworkExceptions error) {
      emit(state.copyWith(
        status: Status.failure,
        message: NetworkExceptions.getErrorMessage(error),
      ));
    });
  }

  void forgotAccessCode(String phoneNumber) async {
    emit(state.copyWith(status: Status.loading));
    ApiResult<dynamic> accessCodeResponse =
        await authRepository.forgotAccessCode(phoneNumber);
    accessCodeResponse.when(success: (dynamic response) {
      emit(state.copyWith(
          status: Status.forgotAccesscodeSuccess, accessCode: response["accessCode"]));
      secureStorage.writeToLocalStorage(
          "ACCESS_CODE", response["accessCode"].toString());
      // log("********************[RECEIVED TOKEN]->   ${response["data"]["token"].toString()}  ");
      // const secureStorage = FlutterSecureStorage();
      // secureStorage.write(
      //     key: "TOKEN", value: response["data"]["token"].toString());
    }, failure: (NetworkExceptions error) {
      emit(state.copyWith(
        status: Status.failure,
        message: NetworkExceptions.getErrorMessage(error),
      ));
    });
  }

  void loginUserWithAccessCode(String accessCode, bool rememberMe) async {
    emit(state.copyWith(status: Status.loading));
    ApiResult<dynamic> sinupResponse =
        await authRepository.loginUserWithAccessCode(accessCode);
    sinupResponse.when(success: (dynamic response) async {
      secureStorage.writeToLocalStorage(
          "TOKEN", response["data"]["token"].toString());
      await secureStorage.writeToLocalStorage(
          "ACCESS_CODE", rememberMe ? accessCode : "");
      emit(state.copyWith(
        status: Status.success,
      ));
      log("********************[RECEIVED TOKEN]->   ${response["data"]["token"].toString()}  ");
      // const secureStorage = FlutterSecureStorage();
      // secureStorage.write(
      //     key: "TOKEN", value: response["data"]["token"].toString());

    }, failure: (NetworkExceptions error) {
      emit(state.copyWith(
        status: Status.failure,
        message: NetworkExceptions.getErrorMessage(error),
      ));
    });
  }

  Future<String> readAccessCodeFromDB() async {
    // read access code from local database

    return await secureStorage.readFromLocalStorage("ACCESS_CODE");
  }

// class AuthCubit extends Cubit<AuthState> {
//   final SecureStorage secureStorage;
//   final AuthRepository authRepository;

//   // final LocaleCubit localeCubit;
//   AuthCubit({
//     required this.secureStorage,
//     required this.authRepository,
//     // required this.localeCubit,

  // Future<String> accessCode;
  // accessCode = secureStorage.readFromLocalStorage("ACCESS_CODE");

  // return accessCode.toString();
  // }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toMap();
  }
}
