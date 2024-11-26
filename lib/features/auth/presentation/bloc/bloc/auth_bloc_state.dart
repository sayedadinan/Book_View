part of 'auth_bloc.dart';

// Base class for states
abstract class AuthBlocState {}

// State for when the password is hidden
class PasswordHidden extends AuthBlocState {}

// State for when the password is visible
class PasswordVisible extends AuthBlocState {}
