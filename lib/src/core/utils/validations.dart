import 'package:flutter/cupertino.dart';

class Validations {
  //! Password Validation
  static String? password(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'Required Field';
    } else if (value.length < 8) {
      return 'context.tr.passwordMustBeAtLeast8CharactersLong';
    }
    return null;
  }

  //! Phone Number Validation
  static String? phoneNumber(BuildContext context, value) {
    String pattern = r'(^(?:[0]9)?[0-9]{1,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Required Field';
    } else if (!regExp.hasMatch(value)) {
      return 'enterValidPhoneNumber';
    }
    return null;
  }

  //! Numbers Only Validation
  static String? numbersOnly(BuildContext context, value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Required Field';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter Valid Number';
    }
    return null;
  }

  //! Email Validation
  static String? email(BuildContext context, String? value) {
    final RegExp urlExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value == null || value.isEmpty) {
      return 'Required Field';
    } else if (!urlExp.hasMatch(value)) {
      return 'Enter Valid Email';
    }
    return null;
  }

  //! Must Be Not Empty Validation
  static String? mustBeNotEmpty(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'Required Field';
    }
    return null;
  }
}
