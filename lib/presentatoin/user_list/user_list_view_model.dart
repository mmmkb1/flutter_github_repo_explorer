import 'package:flutter/material.dart';
import 'package:flutter_github_repo_explorer/domain/model/user.dart';
import 'package:flutter_github_repo_explorer/domain/repository/user_repository.dart';

class UserListViewModel extends ChangeNotifier {
  final UserRepository _userRepository;

  UserListViewModel(this._userRepository) {
    fetchUsers();
  }

  List<User> _users = [];
  bool _isLoading = false;
  bool _hasError = false;

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  Future<void> fetchUsers() async {
    _isLoading = true;
    _hasError = false;
    notifyListeners();

    try {
      _users = await _userRepository.fetchUsers(
        page: 1,
        perPage: 10,
      );
    } catch (e) {
      _hasError = true;
      // Log the error
      print('Error fetching users: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
