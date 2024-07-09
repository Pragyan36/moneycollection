import 'package:flutter/material.dart';

class CustomValidator {
  static String? validaterequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an Name.';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address.';
    }
    // You can add a more sophisticated email validation logic here if needed.
    if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password.';
    }
    // Add password validation rules as needed.
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Username.';
    }
    return null;
  }

  // Add more validation methods as needed.

  // Example of how to use multiple validators in a TextFormField:
  static List<FormFieldValidator<String>> emailAndPasswordValidators() {
    return [
      validateEmail,
      validatePassword,
    ];
  }
}
