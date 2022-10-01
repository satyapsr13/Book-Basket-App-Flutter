// import 'package:flutter/cupertino.dart';

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:book_basket/Data/services/api_result.dart';
import 'package:book_basket/Data/services/dio_client.dart';
import 'package:book_basket/Data/services/network_exceptions.dart';

class AuthRepository {
  late DioClient dioClient;

  AuthRepository() {
    dioClient = DioClient();
  }

  Future<ApiResult<dynamic>> SinupUser(
      String userName,
      String firstName,
      String lastName,
      String dateofBirth,
      String password,
      String accessCode,
      String mobileNumber) async {
    Map details = {
      "userName": userName,
      "firstName": firstName,
      "lastName": lastName,
      "accessCode": accessCode,
      "dateofBirth": dateofBirth,
      "password": password,
      "mobileNumber": mobileNumber
    };
    log("-------SignUp Post Data----------${json.encode(details).toString()}----------");
    try {
      final response =
          await dioClient.post("/api/Auth/signup", data: json.encode(details));

      log("----------------> AuthRepository -> SinupUser  -> response ->  ${response.toString()} ----------------");
      return ApiResult.success(data: response);
    } catch (e) {
      log("----------------> AuthRepository -> SinupUser  -> error ->  ${e.toString()} ----------------");

      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<dynamic>> LoginUser(String userName, String password) async {
    Map details = {
      "userName": userName,
      "password": password,
    };
    log(json.encode(details).toString());
    try {
      final response =
          await dioClient.post("/api/Auth/login", data: json.encode(details));

      log("----------------> AuthRepository -> LoginUser  -> response ->  ${response.toString()} ----------------");
      return ApiResult.success(data: response);
    } catch (e) {
      log("----------------> AuthRepository -> LoginUser  -> error ->  ${e.toString()} ----------------");
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<dynamic>> loginUserWithAccessCode(String accessCode) async {
    Map details = {"AccessCode": accessCode};
    log(json.encode(details).toString());
    try {
      final response =
          await dioClient.post("/api/Auth/login", data: json.encode(details));

      log("----------------> AuthRepository -> LoginUser  -> response ->  ${response.toString()} ----------------");
      return ApiResult.success(data: response);
    } catch (e) {
      log("----------------> AuthRepository -> LoginUser  -> error ->  ${e.toString()} ----------------");
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<dynamic>> forgotAccessCode(String phoneNumber ) async {
    Map details = {"mobileNumber": phoneNumber};
    log(json.encode(details).toString());
    try {
      final response = await dioClient.post("/api/Auth/forgetAccess",
          data: json.encode(details));

      log("----------------> AuthRepository -> forgotAccessCode  -> response ->  ${response.toString()} ----------------");
      return ApiResult.success(data: response);
    } catch (e) {
      log("----------------> AuthRepository -> forgotAccessCode  -> error ->  ${e.toString()} ----------------");
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  // Future<ApiResult<dynamic>> verifyOtp(
  //     String userId, String phoneNumber, int verificationCode) async {
  //   try {
  //     final response = await dioClient.post("/identity/OTP/verify", data: {
  //       "userId": userId,
  //       "phoneNumber": phoneNumber,
  //       "verificationCode": verificationCode
  //     });
  //     return const ApiResult.success(data: "otpVerificationResponse");
  //   } catch (e) {
  //     return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //   }
  // }
}
