import 'package:easy_localization/easy_localization.dart';

String? validateValueWithRegex(
    String? value, String fieldName, String pattern) {
  if (value != null) {
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Enter a valid $fieldName";
    } else {
      return null;
    }
  } else {
    return tr('fieldCannotBeEmpty', namedArgs: {"fieldName": fieldName});
  }
}

String? isValidPhoneNumber(String? string) {
  if (string == null || string.isEmpty) {
    return tr('fieldCannotBeEmpty', namedArgs: {"fieldName": "Phone number"});
  }

  const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(string)) {
    return "Enter a valid phone number";
  }
  return null;
}

String? isValidOtp(String? string) {
  if (string == null || string.isEmpty) {
    return tr('fieldCannotBeEmpty', namedArgs: {"fieldName": 'OTP'});
  }

  const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(string)) {
    return "Enter a valid OTP";
  } else if (string.length != 4) {
    return "Enter a valid OTP";
  }
  return null;
}

String? nullEmptyValidation(String? string, String fieldName) {
  if (string == null || string.isEmpty) {
    return tr('fieldCannotBeEmpty', namedArgs: {"fieldName": fieldName});
  }
  return null;
}

String? validatePhoneNumber(String? string, String fieldName) {
  RegExp phoneRegex = RegExp(r"^[0-9]");
  if (string != null) {
    if (phoneRegex.hasMatch(string)) {
      if (string.startsWith('0')) {
        return "$fieldName cannot start with 0";
      }
      if (string.length < 10) {
        return "$fieldName cannot be less than 10 digits";
      } else {
        return null;
      }
    } else {
      return "Enter valid input";
    }
  }
  return tr('fieldCannotBeEmpty', namedArgs: {"fieldName": fieldName});
}

String? emailValidation(String? string) {
  RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (string == null || string.isEmpty) {
    return "Enter email id";
  } else if (!emailRegex.hasMatch(string)) {
    return "Enter valid email";
  }
  return null;
}

String? nullValidation(String? string) {
  if (string == null || string.isEmpty) {
    return "This field can not be empty";
  }
  return null;
}

String getPlainPhoneNumber(String phoneNumber) {
  return phoneNumber
      .trim()
      .replaceAll(' ', '')
      .replaceAll('(', '')
      .replaceAll(')', '')
      .replaceAll('-', '');
}

String phoneNumberWithCountryCode(String phone) {
  final regex = RegExp(r"^0+(?!$)");
  String res = phone
      .trim()
      .replaceAll(' ', '')
      .replaceAll('(', '')
      .replaceAll(')', '')
      .replaceAll('-', '');
  res = res.replaceAllMapped(regex, (match) {
    return '';
  });
  if (res.startsWith("+")) {
    res = res.replaceAll("+", '');
  } else if (res.startsWith("00")) {
    res = res;
  } else {
    res = "63$res";
  }
  return res;
}

String formatDate(DateTime date) {
  return DateFormat('dd MMM yyyy').format(date.toLocal());
}

String formatDateSlash(DateTime date) {
  return DateFormat('dd/MM/yyyy').format(date.toLocal());
}

formatQuantity(num n) {
  if (n == 0) {
    return "0";
  }
  final f = NumberFormat("###.00");
  final s = f.format(n);
  return s.endsWith('00') ? s.substring(0, s.length - 3) : s;
}
