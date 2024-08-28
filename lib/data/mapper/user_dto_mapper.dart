import 'package:flutter_github_repo_explorer/data/dto/user_dto.dart';
import 'package:flutter_github_repo_explorer/domain/model/user.dart';

extension UserDtoMapper on UserDto {
  User toDomain() {
    return User(
      avatarUrl: avatarUrl!,
      username: login!,
    );
  }
}
