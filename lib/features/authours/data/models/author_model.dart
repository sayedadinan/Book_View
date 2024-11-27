import 'package:books_app/features/authours/domain/entities/author.dart';

class AuthorModel extends Author {
  AuthorModel({
    required super.id,
    required super.name,
    required super.birthdate,
    required super.biography,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json['id'],
      name: json['name'],
      birthdate: DateTime.parse(json['birthdate']),
      biography: json['biography'],
    );
  }
}
