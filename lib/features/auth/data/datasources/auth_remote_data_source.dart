import 'dart:convert';
import 'dart:developer';
import 'package:books_app/core/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> registerUser(String username, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<Map<String, dynamic>> registerUser(
      String username, String password) async {
    log('this datas showing dfdfdfdfd');
    final url = Uri.parse('${AppApis.baseUrl}api/auth/register');
    final response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'accept': '*/*',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );
    log('checking from here ${response.statusCode}');
    if (response.statusCode == 201) {
      log('this datas showing ${response.body}');
      final responseData = jsonDecode(response.body);

      // Extract the token
      final token = responseData['result']['access_token'];

      // Save the token to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);

      log('Token saved to SharedPreferences: $token');
      return jsonDecode(response.body);
    } else {
      log('this datas showing ${response.body}');
      final responseData = jsonDecode(response.body);

      // Extract the token
      final token = responseData['message'];
      throw Exception('Failed to register user: $token');
    }
  }
}
