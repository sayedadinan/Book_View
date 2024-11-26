import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:books_app/core/utils/shared_preference.dart';

abstract class RatingRemoteDataSource {
  Future<void> addRating(String bookId, int rating);
}

class RatingRemoteDataSourceImpl implements RatingRemoteDataSource {
  final http.Client client;

  RatingRemoteDataSourceImpl({required this.client});

  @override
  Future<void> addRating(String bookId, int rating) async {
    final token = SharedPreferencesHelper.token;
    final url = Uri.parse(
        'https://assessment.eltglobal.in/api/books/$bookId/ratings:add');

    final response = await client.patch(
      url,
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'rating': rating}),
    );
    if (response.statusCode == 200) {
      log('successssfylly added rating');
    }
    if (response.statusCode != 200) {
      throw Exception('Failed to add rating: ${response.body}');
    }
  }
}
