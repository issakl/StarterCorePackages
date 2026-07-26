import 'package:starter_localization/l10n.dart';

import 'app_regex.dart';

class Validator {
  static String? multiValidator(
      String? value, List<String? Function(String?)> validators) {
    for (var validator in validators) {
      final message = validator(value);
      if (message != null) {
        return message;
      }
    }
    return null;
  }

  static String? notEmptyValidator(String? value) {
    if (isNullOrEmpty(value)) {
      return CoreS.current.thisFieldIsRequired;
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (isNullOrEmpty(value)) {
      return CoreS.current.thisFieldIsRequired;
    }
    if (!AppRegex.emailRegex.hasMatch(value!)) {
      return CoreS.current.invalidEmail;
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (isNullOrEmpty(value)) {
      return CoreS.current.thisFieldIsRequired;
    }
    if (!AppRegex.phoneRegex.hasMatch(value!)) {
      return CoreS.current.invalidPhone;
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (isNullOrEmpty(value)) {
      return CoreS.current.thisFieldIsRequired;
    }
    if (!AppRegex.nameRegex.hasMatch(value!)) {
      return CoreS.current.errorEmptyField;
    }
    return null;
  }

  static String? lengthValidator(String? value,
      {int minLength = 0, double maxLength = double.infinity}) {
    if (isNullOrEmpty(value)) {
      return CoreS.current.thisFieldIsRequired;
    }
    if (value!.length < minLength) {
      return CoreS.current.theMinLengthShouldBeMoreThan;
    }
    if (value.length > maxLength) {
      return CoreS.current.theMaxLengthShouldBeLessThan;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (isNullOrEmpty(value)) {
      return CoreS.current.thisFieldIsRequired;
    }
    if (!AppRegex.passwordRegex.hasMatch(value!)) {
      return CoreS.current.invalidPassword;
    }
    return null;
  }

  static bool isNullOrEmpty(String? value) {
    return value == null || value.isEmpty;
  }
}
