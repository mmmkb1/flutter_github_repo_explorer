import 'package:flutter/material.dart';
import 'package:flutter_github_repo_explorer/core/router.dart';
import 'package:flutter_github_repo_explorer/data/data_source/api_user_data_source.dart';

void main() async {
  ApiUserDataSource apiUserDataSource = ApiUserDataSource();
  print(await apiUserDataSource.fetchUsers(page: 1, perPage: 10));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter GitHub Repo Explorer',
      routerConfig: router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
