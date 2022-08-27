import 'dart:convert';
import 'dart:developer';

import 'package:nhsbpmonitor/Data/model/api/BloodPressure/blood_pressure_model.dart';
import 'package:nhsbpmonitor/Data/model/api/UserProfile/user_profile_model.dart';
import 'package:nhsbpmonitor/Data/model/api/UserProfile/users_doctors_details.dart';
import 'package:nhsbpmonitor/Data/services/api_result.dart';
import 'package:nhsbpmonitor/Data/services/dio_client.dart';
import 'package:nhsbpmonitor/Data/services/network_exceptions.dart';

class UserProfileRepository {
  late DioClient dioClient;

  UserProfileRepository() {
    dioClient = DioClient();
  }

  Future<ApiResult<dynamic>> updateUserProfile(
      String bloodGroup,
      String weight,
      String height,
      String state,
      String city,
      String ethinicCategory,
      String smoker,
      String age,
      String birthBeforePregnency,
      String bookingEMI,
      String currentBMI) async {
    Map userProfileData = {
      "nationality": "Indian",
      "maritalStatus": "Yes",
      "ethnicCategory": ethinicCategory,
      "smokerAtBooking": smoker == "Yes",
      "bloodType": bloodGroup,
      "numberOfPreviousPregnancies": int.parse(birthBeforePregnency),
      "numberOfChildren": int.parse(birthBeforePregnency),
      "height": double.parse(height),
      "previousPregnancyHypertension": "previousPregnancyHypertension",
      "hypertension": "string",
      "medicationForHypertension": "string",
      "patientWeights": double.parse(weight),
      "age": age,
    };
    log(" Data to post in Backend [ ${userProfileData.toString()}  ]");

    try {
      final response = await dioClient.post("/api/Patient/adddetails",
          // final response = await dioClient.post("api/BloodPressures/addReading",
          data: userProfileData);

      log("----------------> UserProfileRepository -> updateUserProfile  -> response ->  ${response.toString()} ----------------");
      return ApiResult.success(data: response);
    } catch (e) {
      log("----------------> UserProfileRepository -> updateUserProfile  -> error ->  ${e.toString()} ----------------");
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<dynamic>> loginUserWithAccessCode(String accessCode) async {
    Map details = {"AccessCode": accessCode};
    // log(json.encode(details).toString());
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

  Future<ApiResult<BloodPressureResponse>> fetchBPReadingList() async {
    try {
      final response = await dioClient.get(
        "/api/BloodPressures/last",
        // data: json.encode(userProfileData));
      );
      log("----------------> UserProfileRepository -> fetchBPReadingList  -> response ->  ${response.toString()} ----------------");

      BloodPressureResponse bloodPressureResponse =
          BloodPressureResponse.fromJson(response);
      return ApiResult.success(data: bloodPressureResponse);
    } catch (e) {
      log("----------------> UserProfileRepository -> fetchBPReadingList  -> error ->  ${e.toString()} ----------------");

      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<dynamic>> fetchLastWeight() async {
    try {
      final response = await dioClient.get(
        "api/PatientWeights/last?count=1",
        // "api/PatientWeights/last",
        // data: json.encode(userProfileData));
      );
      log("----------------> UserProfileRepository -> fetchLastWeight  -> response ->  ${response.toString()} ----------------");

      // BloodPressureResponse bloodPressureResponse =
      //     BloodPressureResponse.fromJson(response);
      return ApiResult.success(data: response);
    } catch (e) {
      log("----------------> UserProfileRepository -> fetchLastWeight  -> error ->  ${e.toString()} ----------------");

      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<dynamic>> fetchLastBPReading() async {
    try {
      final response = await dioClient.get(
        "api/BloodPressures/last?count=1",
      );
      log("----------------> UserProfileRepository -> fetchLastWeight  -> response ->  ${response.toString()} ----------------");

      // BloodPressureResponse bloodPressureResponse =
      //     BloodPressureResponse.fromJson(response);
      return ApiResult.success(data: response);
    } catch (e) {
      log("----------------> UserProfileRepository -> fetchLastWeight  -> error ->  ${e.toString()} ----------------");

      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<UserDetailsResponse>> fetchUserDetails() async {
    try {
      final response = await dioClient.get(
        "/api/Patient/getpatients",
      );
      log("----------------> UserProfileRepository -> fetchUserDetails  -> response ->  ${response.toString()} ----------------");

      UserDetailsResponse userDetailsResponse =
          UserDetailsResponse.fromJson(response);
      return ApiResult.success(data: userDetailsResponse);
    } catch (e) {
      log("----------------> UserProfileRepository -> fetchUserDetails  -> error ->  ${e.toString()} ----------------");

      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<UsersHospitalAndDoctorDetailsResponse>>
      fetchUsersDoctorAndHospitalDetails() async {
    try {
      final response = await dioClient.get(
        "/api/Patient/getalldoctors",
      );
      log("----------------> UserProfileRepository -> fetchUsersDoctorAndHospitalDetails  -> response ->  ${response.toString()} ----------------");

      UsersHospitalAndDoctorDetailsResponse userDetailsResponse =
          UsersHospitalAndDoctorDetailsResponse.fromJson(response);
      return ApiResult.success(data: userDetailsResponse);
    } catch (e) {
      log("----------------> UserProfileRepository -> fetchUsersDoctorAndHospitalDetails  -> error ->  ${e.toString()} ----------------");

      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<dynamic>> checkBPRange(
      int systolicBP, int diastolicBP) async {
    Map data = {
      "systolicBP": systolicBP,
      "diastolicBP": diastolicBP,
    };
    try {
      final response = await dioClient.post(
        "/api/Patient/checkbprange",
        data: data,
      );
      log(response.toString());
      log("----------------> UserProfileRepository -> checkBPRange  -> response ->  ${response.toString()} ----------------");

      return ApiResult.success(data: response);
    } catch (e) {
      log("----------------> UserProfileRepository -> checkBPRange  -> error ->  ${e.toString()} ----------------");

      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<dynamic>> addBPReading(
      int systolicBP, int diastolicBP) async {
    Map data = {
      "systolicBP": systolicBP,
      "diastolicBP": diastolicBP,
    };
    try {
      final response =
          await dioClient.post("/api/BloodPressures/addReading", data: data);
      log("----------------> UserProfileRepository -> addBPReading  -> response ->  ${response.toString()} ----------------");

      dynamic bloodPressureResponse = response;
      return ApiResult.success(data: bloodPressureResponse);
    } catch (e) {
      log("----------------> UserProfileRepository -> addBPReading  -> error ->  ${e.toString()} ----------------");

      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<dynamic>> updateWeight(num weight) async {
    Map data = {
      "weight": weight,
    };
    try {
      final response =
          await dioClient.post("/api/PatientWeights/addReading", data: data);
      dynamic bloodPressureResponse = response;
      log("----------------> UserProfileRepository -> updateWeight  -> response ->  ${response.toString()} ----------------");

      return ApiResult.success(data: bloodPressureResponse);
    } catch (e) {
      log("----------------> UserProfileRepository -> updateWeight  -> error ->  ${e.toString()} ----------------");

      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
