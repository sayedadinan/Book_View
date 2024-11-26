import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

/// Abstract class for BookRemoteDataSource
abstract class BookRemoteDataSource {
  Future<List<Map<String, dynamic>>> fetchBooks(int page, int limit);
}

/// Implementation of BookRemoteDataSource
class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  final http.Client client;

  BookRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Map<String, dynamic>>> fetchBooks(int page, int limit) async {
    log('Fetching books from remote data source');
    final url = Uri.parse(
        'https://assessment.eltglobal.in/api/books?page=$page&limit=$limit');
    final response = await client.get(url, headers: {'accept': '*/*'});

    if (response.statusCode == 200) {
      log('Books fetched successfully ${response.body}');
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data['result']);
    } else {
      log('Failed to fetch books: ${response.statusCode}');
      throw Exception('Failed to fetch books: ${response.statusCode}');
    }
  }
  
}
