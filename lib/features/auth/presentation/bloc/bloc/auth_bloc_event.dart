part of 'auth_bloc_bloc.dart';
abstract class AuthEvent {}

class RegisterUserEvent extends AuthEvent {
  final String username;
  final String password;

  RegisterUserEvent({required this.username, required this.password});
}
