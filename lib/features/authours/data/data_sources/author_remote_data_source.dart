import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

abstract class AuthorRemoteDataSource {
  Future<List<Map<String, dynamic>>> fetchAuthors();
}

class AuthorRemoteDataSourceImpl implements AuthorRemoteDataSource {
  final http.Client client;

  AuthorRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Map<String, dynamic>>> fetchAuthors() async {
    log('here this is working ');
    final url = Uri.parse('https://assessment.eltglobal.in/api/authors');
    final response = await client.get(url, headers: {'accept': '*/*'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data['result']);
    } else {
      throw Exception('Failed to fetch authors: ${response.statusCode}');
    }
  }
}
