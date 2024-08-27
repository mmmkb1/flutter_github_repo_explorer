import 'package:flutter/material.dart';
import 'package:flutter_github_repo_explorer/domain/model/user.dart';

class UserItem extends StatelessWidget {
  final User user;

  const UserItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatarUrl),
      ),
      title: Text(user.username),
      onTap: () {},
    );
  }
}
