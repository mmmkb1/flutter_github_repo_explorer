import 'package:flutter/material.dart';
import 'package:flutter_github_repo_explorer/domain/model/user.dart';
import 'package:flutter_github_repo_explorer/domain/repository/user_repository.dart';

class UserListViewModel extends ChangeNotifier {
  final UserRepository _userRepository;
  UserListViewModel(this._userRepository) {
    fetchFirstPageUsers();
  }

  final List<User> _users = [];
  bool _isLoading = false;
  bool _hasError = false;
  int _currentPage = 1;

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  int get currentPage => _currentPage;

  Future<void> fetchFirstPageUsers() async {
    _users.clear();
    notifyListeners();

    final newUsers = await _userRepository.fetchUsers(page: 1, perPage: 3);
    // await Future.delayed(const Duration(seconds: 1));

    _users.addAll(newUsers);
    notifyListeners();
  }

  Future<void> fetchUsersWithPagination({required int perPage}) async {
    if (_isLoading) return; // 중복 호출 방지
    _isLoading = true;
    _hasError = false;
    notifyListeners();

    try {
      final newUsers = await _userRepository.fetchUsers(
        page: _currentPage,
        perPage: perPage,
      );
      _users.addAll(newUsers);
      _currentPage++;
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
