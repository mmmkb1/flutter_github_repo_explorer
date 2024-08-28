import 'package:flutter_github_repo_explorer/data/data_source/user_data_source.dart';
import 'package:flutter_github_repo_explorer/data/dto/user_dto.dart';
import 'package:flutter_github_repo_explorer/domain/model/user.dart';
import 'package:flutter_github_repo_explorer/data/mapper/user_dto_mapper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiUserDataSource implements UserDataSource {
  static const String _baseUrl = 'https://api.github.com/users';

  @override
  Future<List<User>> fetchUsers(
      {required int page, required int perPage}) async {
    final url = '$_baseUrl?since=${(page - 1) * perPage}&per_page=$perPage';
    print('Requesting URL: $url');

    final response = await http.get(Uri.parse(url));

    print('Response status code: ${response.statusCode}');
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<UserDto> userDtos =
          data.map((json) => UserDto.fromJson(json)).toList();
      return userDtos.map((userDto) => userDto.toDomain()).toList();
    } else {
      print('Response body: ${response.body}');
      throw Exception('Failed to load users');
    }
  }
}
