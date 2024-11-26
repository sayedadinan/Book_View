import '../entities/author.dart';
import '../repositories/author_repository.dart';

class GetAuthors {
  final AuthorRepository repository;

  GetAuthors({required this.repository});

  Future<List<Author>> call() {
    return repository.getAuthors();
  }
}
