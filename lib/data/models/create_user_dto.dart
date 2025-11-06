import 'package:onway/domain/entities/email.dart';

class CreateUserDto {
  final String user;
  final Email email;
  final String password;

  CreateUserDto({
    required this.user,
    required this.email,
    required this.password,
  });
}
