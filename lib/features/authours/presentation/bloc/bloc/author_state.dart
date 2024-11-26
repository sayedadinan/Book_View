part of 'author_bloc.dart';

abstract class AuthorState {}

class AuthorInitial extends AuthorState {}

class AuthorLoading extends AuthorState {}

class AuthorLoaded extends AuthorState {
  final List<Author> authors;

  AuthorLoaded({required this.authors});
}

class AuthorError extends AuthorState {
  final String error;

  AuthorError({required this.error});
}
