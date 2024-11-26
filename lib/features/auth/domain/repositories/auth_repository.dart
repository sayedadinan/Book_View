import '../entities/auth.dart';

abstract class AuthRepository {
  Future<Auth> registerUser(String username, String password);
}
