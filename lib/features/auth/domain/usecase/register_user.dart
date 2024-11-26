import 'package:books_app/features/auth/domain/entities/auth.dart';
import 'package:books_app/features/auth/domain/repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser({required this.repository});

  Future<Auth> call(String username, String password) {
    return repository.registerUser(username, password);
  }
}
