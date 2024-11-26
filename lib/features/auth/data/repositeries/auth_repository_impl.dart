import 'package:books_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:books_app/features/auth/data/models/auth_model.dart';
import 'package:books_app/features/auth/domain/entities/auth.dart';
import 'package:books_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Auth> registerUser(String username, String password) async {
    final response = await remoteDataSource.registerUser(username, password);
    // Convert response to AuthModel and cast to Auth
    return AuthModel.fromJson(response); // AuthModel implements Auth
  }
}
