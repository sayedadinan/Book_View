import '../entities/author.dart';

abstract class AuthorRepository {
  Future<List<Author>> getAuthors();
}
