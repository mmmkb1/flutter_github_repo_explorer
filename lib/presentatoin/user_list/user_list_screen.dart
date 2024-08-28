import 'package:flutter/material.dart';
import 'package:flutter_github_repo_explorer/domain/model/user.dart';
import 'package:flutter_github_repo_explorer/presentatoin/user_list/component/user_item.dart';
import 'package:flutter_github_repo_explorer/presentatoin/user_list/user_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Consumer<UserListViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (viewModel.hasError) {
            return const Center(child: Text('Error fetching users'));
          } else {
            return RefreshIndicator(
              onRefresh: viewModel.fetchFirstPageUsers,
              child: ListView.builder(
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
