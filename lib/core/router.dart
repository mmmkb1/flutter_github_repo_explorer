import 'package:flutter_github_repo_explorer/data/data_source/api_user_data_source.dart';
import 'package:flutter_github_repo_explorer/data/data_source/mock_user_datasource.dart';
import 'package:flutter_github_repo_explorer/data/repository/user_repository_impl.dart';
import 'package:flutter_github_repo_explorer/presentatoin/repository_list/repository_list_screen.dart';
import 'package:flutter_github_repo_explorer/presentatoin/user_list/user_list_screen.dart';
import 'package:flutter_github_repo_explorer/presentatoin/user_list/user_list_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => ChangeNotifierProvider(
              create: (context) =>
                  UserListViewModel(UserRepositoryImpl(MockUserDataSource())),
              child: const UserListScreen(),
            )),
    GoRoute(
      path: '/repositories',
      builder: (context, state) {
        final username = state.extra as String;
        return RepositoryListScreen(username: username);
      },
    ),
  ],
);
