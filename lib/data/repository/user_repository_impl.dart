import 'package:flutter_github_repo_explorer/data/data_source/user_data_source.dart';
import 'package:flutter_github_repo_explorer/domain/model/user.dart';
import 'package:flutter_github_repo_explorer/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDatasource;

  UserRepositoryImpl(this._userDatasource);

  @override
  Future<List<User>> fetchUsers({required int page, required int perPage}) {
    return _userDatasource.fetchUsers(page: page, perPage: perPage);
  }
}
