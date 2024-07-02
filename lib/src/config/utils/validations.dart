import 'package:ecommerce_app/src/config/utils/regex.dart';

String? validateEmail(String? val) {
  if (val!.isEmpty) {
    return '*Required field';
  } else if (!RegExp(emailRegexPattern).hasMatch(val) || val.isEmpty) {
    return 'Enter a valid email';
  }
  return null;
}

String? validatePassword(String? val) {
  if (val!.isEmpty) {
    return '*Required field';
  } else if (val.length < 9) {
    return 'Password should be 8 characters';
  }
  return null;
}

String? validatePasswordLogin(String? val) {
  if (val!.isEmpty) {
    return '*Required field';
  }
  return null;
}

String? validateName(String? val) {
  if (val!.isEmpty) {
    return '*Required field';
  } else if (val.length < 3) {
    return 'Please enter a valid name';
  }
  return null;
}
