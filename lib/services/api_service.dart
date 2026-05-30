import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class ApiService {

  static Future<List<UserModel>> fetchUsers() async {

    const String url =
        'https://jsonplaceholder.typicode.com/users';

    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {

      List data = jsonDecode(response.body);

      return data
          .map(
            (user) => UserModel.fromJson(user),
      )
          .toList();

    } else {

      throw Exception('Failed to load users');
    }
  }
}