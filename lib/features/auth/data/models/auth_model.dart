import 'package:books_app/features/auth/domain/entities/auth.dart';

class AuthModel extends Auth {
  AuthModel({
    required String accessToken,
    required String tokenType,
    required String message,
  }) : super(
          accessToken: accessToken,
          tokenType: tokenType,
          message: message,
        );

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      accessToken: json['result']['access_token'],
      tokenType: json['result']['token_type'],
      message: json['result']['message'],
    );
  }
}
