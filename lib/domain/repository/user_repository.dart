import 'package:flutter_github_repo_explorer/domain/model/user.dart';

abstract interface class UserRepository {
  Future<List<User>> fetchUsers({required int page, required int perPage});
}
