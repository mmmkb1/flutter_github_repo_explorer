import 'package:flutter/material.dart';
import 'package:flutter_github_repo_explorer/domain/model/user.dart';
import 'package:flutter_github_repo_explorer/presentatoin/user_list/component/user_item.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: const UserItem(
              user: User(
                avatarUrl: 'https://avatars.githubusercontent.com/u/583231?v=4',
                username: 'octocat',
              ),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
