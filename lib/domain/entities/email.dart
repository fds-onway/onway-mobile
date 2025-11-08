import 'package:email_validator/email_validator.dart';

class Email {
  final String value;

  Email(this.value);

  bool isValid() {
    return isValidEmail(value);
  }

  static bool isValidEmail(String email) {
    return EmailValidator.validate(email);
  }
}
