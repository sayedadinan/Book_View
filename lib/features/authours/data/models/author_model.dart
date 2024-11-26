import 'package:books_app/features/authours/domain/entities/author.dart';

class AuthorModel extends Author {
  AuthorModel({
    required String id,
    required String name,
    required DateTime birthdate,
    required String biography,
  }) : super(
          id: id,
          name: name,
          birthdate: birthdate,
          biography: biography,
        );

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json['id'],
      name: json['name'],
      birthdate: DateTime.parse(json['birthdate']),
      biography: json['biography'],
    );
  }
}
