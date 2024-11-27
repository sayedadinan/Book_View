import 'package:books_app/features/auth/domain/entities/auth.dart';

class AuthModel extends Auth {
  AuthModel({
    required super.accessToken,
    required super.tokenType,
    required super.message,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      accessToken: json['result']['access_token'],
      tokenType: json['result']['token_type'],
      message: json['result']['message'],
    );
  }
}
