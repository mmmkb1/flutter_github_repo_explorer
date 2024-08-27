import 'package:flutter_github_repo_explorer/presentatoin/repository_list/repository_list_screen.dart';
import 'package:flutter_github_repo_explorer/presentatoin/user_list/user_list_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const UserListScreen(),
    ),
    GoRoute(
      path: '/repositories',
      builder: (context, state) {
        final username = state.extra as String;
        return RepositoryListScreen(username: username);
      },
    ),
  ],
);
