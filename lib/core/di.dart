import 'dart:developer';

import 'package:books_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:books_app/features/authours/data/data_sources/author_remote_data_source.dart';
import 'package:books_app/features/authours/data/repositories/author_repository_impl.dart';
import 'package:books_app/features/authours/domain/repositories/author_repository.dart';
import 'package:books_app/features/books/data/datasources/book_remote_data_source.dart';
import 'package:books_app/features/books/data/datasources/rating_remote_data_source.dart';
import 'package:books_app/features/books/data/repositories/book_repository_impl.dart';
import 'package:books_app/features/books/data/repositories/rating_repository_impl.dart';
import 'package:books_app/features/books/domain/repositeries/book_repository.dart';
import 'package:books_app/features/books/domain/repositeries/rating_repository.dart';
import 'package:books_app/features/books/domain/usecase/add_rating.dart';
import 'package:books_app/features/books/domain/usecase/get_books.dart';
import 'package:books_app/features/books/presentation/bloc/bloc/book_bloc.dart';
import 'package:books_app/features/books/presentation/bloc/bloc/rating_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:books_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:books_app/features/auth/data/repositeries/auth_repository_impl.dart';
import 'package:books_app/features/auth/domain/usecase/register_user.dart';
import 'package:books_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:books_app/features/authours/domain/usecase/get_authors.dart';
import 'package:books_app/features/authours/presentation/bloc/bloc/author_bloc.dart';

final GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  log('Registered dependencies');

  // Registering http client
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  // --- Auth Module ---
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: getIt()));

  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: getIt()));

  getIt.registerLazySingleton<RegisterUser>(
      () => RegisterUser(repository: getIt()));

  getIt.registerFactory<AuthBloc>(() => AuthBloc(registerUser: getIt()));

  // --- Author Module ---
  getIt.registerLazySingleton<AuthorRemoteDataSource>(
      () => AuthorRemoteDataSourceImpl(client: getIt()));

  getIt.registerLazySingleton<AuthorRepository>(
      () => AuthorRepositoryImpl(remoteDataSource: getIt()));

  getIt
      .registerLazySingleton<GetAuthors>(() => GetAuthors(repository: getIt()));

  getIt.registerFactory<AuthorBloc>(() => AuthorBloc(getAuthors: getIt()));

  // --------------------Books Module ------------------------------------------
  // Registering Book Remote Data Source
  getIt.registerLazySingleton<BookRemoteDataSource>(
      () => BookRemoteDataSourceImpl(client: getIt()));

  // Registering Book Repository
  getIt.registerLazySingleton<BookRepository>(
      () => BookRepositoryImpl(remoteDataSource: getIt()));

  // Registering GetBooks Use Case
  getIt.registerLazySingleton<GetBooks>(() => GetBooks(repository: getIt()));

  // ---------------------rating things paart ------------------------------------------
  getIt.registerFactory<BookBloc>(() => BookBloc(getBooks: getIt()));
  getIt.registerLazySingleton<RatingRemoteDataSource>(
      () => RatingRemoteDataSourceImpl(client: getIt()));
  getIt.registerLazySingleton<RatingRepository>(
      () => RatingRepositoryImpl(remoteDataSource: getIt()));
  getIt.registerLazySingleton<AddRating>(() => AddRating(repository: getIt()));
  getIt.registerFactory<RatingBloc>(() => RatingBloc(addRating: getIt()));
}
