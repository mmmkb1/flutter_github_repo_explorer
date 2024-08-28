import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_github_repo_explorer/domain/model/user.dart';
import 'package:flutter_github_repo_explorer/presentatoin/user_list/component/user_item.dart';
import 'package:flutter_github_repo_explorer/presentatoin/user_list/user_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        _scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
      context.read<UserListViewModel>().fetchUsersWithPagination(
            perPage: 3,
          );
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UserListViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Builder(
        builder: (context) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (viewModel.hasError) {
            return const Center(child: Text('Error fetching users'));
          } else {
            return RefreshIndicator(
              onRefresh: () => viewModel.fetchFirstPageUsers(),
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: _scrollController,
                itemCount: viewModel.users.length,
                itemBuilder: (context, index) {
                  final user = viewModel.users[index];
                  return ListTile(
                    title: UserItem(user: user),
                    onTap: () {
                      context.go('/repositories', extra: user.username);
                    },
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
