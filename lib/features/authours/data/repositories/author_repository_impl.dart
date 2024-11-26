import 'package:books_app/features/authours/data/data_sources/author_remote_data_source.dart';
import 'package:books_app/features/authours/data/models/author_model.dart';
import 'package:books_app/features/authours/domain/entities/author.dart';
import 'package:books_app/features/authours/domain/repositories/author_repository.dart';

class AuthorRepositoryImpl implements AuthorRepository {
  final AuthorRemoteDataSource remoteDataSource;

  AuthorRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Author>> getAuthors() async {
    final authorData = await remoteDataSource.fetchAuthors();
    return authorData.map((json) => AuthorModel.fromJson(json)).toList();
  }
}
