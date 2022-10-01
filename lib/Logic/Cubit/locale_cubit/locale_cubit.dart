// import 'dart:convert';
// import 'dart:io';
// import 'package:book_basket/Constants/enums.dart';
// import 'package:book_basket/Data/repositories/locale_repository.dart';
// import 'package:book_basket/Data/services/api_result.dart';
// import 'package:book_basket/Data/services/network_exceptions.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:flutter/material.dart' show Locale;
// import 'package:path_provider/path_provider.dart';
// import 'package:equatable/equatable.dart';
// part 'locale_state.dart';

// class LocaleCubit extends HydratedCubit<LocaleState> {
//   final LocaleRepository localeRepository;
//   LocaleCubit({required this.localeRepository}) : super(const LocaleState());

//   Future<bool> updateTranslationsFromServer() async {
//     emit(state.copyWith(status: Status.loading));
//     final appSupportDirectory = await getApplicationSupportDirectory();
//     final directory = await appSupportDirectory.create();
//     final path = directory.absolute.path;
//     ApiResult<Map<String, dynamic>> localeResponse =
//         await localeRepository.fetchTranslations();
//     bool res =
//         localeResponse.when(success: (Map<String, dynamic> translations) {
//       translations.forEach((key, value) {
//         File jsonFile = File('$path/$key.json');
//         jsonFile.writeAsString(jsonEncode(value));
//       });
//       emit(state.copyWith(status: Status.success));
//       return true;
//     }, failure: (NetworkExceptions error) {
//       emit(state.copyWith(
//           status: Status.failure,
//           error: NetworkExceptions.getErrorMessage(error)));
//       return false;
//     });
//     return res;
//   }

//   void updateLocale(Locale locale) {
//     String localeStringValue = locale.languageCode +
//         (locale.countryCode != null ? '_${locale.countryCode}' : '');
//     emit(state.copyWith(
//         locale: locale,
//         localeString: localeStringValue,
//         status: Status.updateSuccess));
//   }

//   @override
//   LocaleState? fromJson(Map<String, dynamic> json) {
//     return LocaleState.fromMap(json);
//   }

//   @override
//   Map<String, dynamic>? toJson(LocaleState state) {
//     return state.toMap();
//   }
// }
