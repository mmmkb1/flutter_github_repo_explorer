import 'dart:convert';

import 'package:flutter_github_repo_explorer/data/data_source/user_data_source.dart';
import 'package:flutter_github_repo_explorer/data/dto/user_dto.dart';
import 'package:flutter_github_repo_explorer/data/mapper/user_dto_mapper.dart';
import 'package:flutter_github_repo_explorer/domain/model/user.dart';

class MockUserDataSource implements UserDataSource {
  @override
  Future<List<User>> fetchUsers(
      {required int page, required int perPage}) async {
    // Mock JSON data
    const String mockJsonData = '''
    [
      {
        "login": "mojombo",
        "id": 1,
        "node_id": "MDQ6VXNlcjE=",
        "avatar_url": "https://avatars.githubusercontent.com/u/1?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/mojombo",
        "html_url": "https://github.com/mojombo",
        "followers_url": "https://api.github.com/users/mojombo/followers",
        "following_url": "https://api.github.com/users/mojombo/following{/other_user}",
        "gists_url": "https://api.github.com/users/mojombo/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
        "organizations_url": "https://api.github.com/users/mojombo/orgs",
        "repos_url": "https://api.github.com/users/mojombo/repos",
        "events_url": "https://api.github.com/users/mojombo/events{/privacy}",
        "received_events_url": "https://api.github.com/users/mojombo/received_events",
        "type": "User",
        "site_admin": false
      },
      {
        "login": "defunkt",
        "id": 2,
        "node_id": "MDQ6VXNlcjI=",
        "avatar_url": "https://avatars.githubusercontent.com/u/2?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/defunkt",
        "html_url": "https://github.com/defunkt",
        "followers_url": "https://api.github.com/users/defunkt/followers",
        "following_url": "https://api.github.com/users/defunkt/following{/other_user}",
        "gists_url": "https://api.github.com/users/defunkt/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/defunkt/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/defunkt/subscriptions",
        "organizations_url": "https://api.github.com/users/defunkt/orgs",
        "repos_url": "https://api.github.com/users/defunkt/repos",
        "events_url": "https://api.github.com/users/defunkt/events{/privacy}",
        "received_events_url": "https://api.github.com/users/defunkt/received_events",
        "type": "User",
        "site_admin": false
      },
      {
        "login": "pjhyett",
        "id": 3,
        "node_id": "MDQ6VXNlcjM=",
        "avatar_url": "https://avatars.githubusercontent.com/u/3?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/pjhyett",
        "html_url": "https://github.com/pjhyett",
        "followers_url": "https://api.github.com/users/pjhyett/followers",
        "following_url": "https://api.github.com/users/pjhyett/following{/other_user}",
        "gists_url": "https://api.github.com/users/pjhyett/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/pjhyett/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/pjhyett/subscriptions",
        "organizations_url": "https://api.github.com/users/pjhyett/orgs",
        "repos_url": "https://api.github.com/users/pjhyett/repos",
        "events_url": "https://api.github.com/users/pjhyett/events{/privacy}",
        "received_events_url": "https://api.github.com/users/pjhyett/received_events",
        "type": "User",
        "site_admin": false
      },
      {
        "login": "wycats",
        "id": 4,
        "node_id": "MDQ6VXNlcjQ=",
        "avatar_url": "https://avatars.githubusercontent.com/u/4?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/wycats",
        "html_url": "https://github.com/wycats",
        "followers_url": "https://api.github.com/users/wycats/followers",
        "following_url": "https://api.github.com/users/wycats/following{/other_user}",
        "gists_url": "https://api.github.com/users/wycats/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/wycats/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/wycats/subscriptions",
        "organizations_url": "https://api.github.com/users/wycats/orgs",
        "repos_url": "https://api.github.com/users/wycats/repos",
        "events_url": "https://api.github.com/users/wycats/events{/privacy}",
        "received_events_url": "https://api.github.com/users/wycats/received_events",
        "type": "User",
        "site_admin": false
      },
      {
        "login": "ezmobius",
        "id": 5,
        "node_id": "MDQ6VXNlcjU=",
        "avatar_url": "https://avatars.githubusercontent.com/u/5?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/ezmobius",
        "html_url": "https://github.com/ezmobius",
        "followers_url": "https://api.github.com/users/ezmobius/followers",
        "following_url": "https://api.github.com/users/ezmobius/following{/other_user}",
        "gists_url": "https://api.github.com/users/ezmobius/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/ezmobius/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/ezmobius/subscriptions",
        "organizations_url": "https://api.github.com/users/ezmobius/orgs",
        "repos_url": "https://api.github.com/users/ezmobius/repos",
        "events_url": "https://api.github.com/users/ezmobius/events{/privacy}",
        "received_events_url": "https://api.github.com/users/ezmobius/received_events",
        "type": "User",
        "site_admin": false
      },
      {
        "login": "ivey",
        "id": 6,
        "node_id": "MDQ6VXNlcjY=",
        "avatar_url": "https://avatars.githubusercontent.com/u/6?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/ivey",
        "html_url": "https://github.com/ivey",
        "followers_url": "https://api.github.com/users/ivey/followers",
        "following_url": "https://api.github.com/users/ivey/following{/other_user}",
        "gists_url": "https://api.github.com/users/ivey/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/ivey/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/ivey/subscriptions",
        "organizations_url": "https://api.github.com/users/ivey/orgs",
        "repos_url": "https://api.github.com/users/ivey/repos",
        "events_url": "https://api.github.com/users/ivey/events{/privacy}",
        "received_events_url": "https://api.github.com/users/ivey/received_events",
        "type": "User",
        "site_admin": false
      },
      {
        "login": "evanphx",
        "id": 7,
        "node_id": "MDQ6VXNlcjc=",
        "avatar_url": "https://avatars.githubusercontent.com/u/7?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/evanphx",
        "html_url": "https://github.com/evanphx",
        "followers_url": "https://api.github.com/users/evanphx/followers",
        "following_url": "https://api.github.com/users/evanphx/following{/other_user}",
        "gists_url": "https://api.github.com/users/evanphx/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/evanphx/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/evanphx/subscriptions",
        "organizations_url": "https://api.github.com/users/evanphx/orgs",
        "repos_url": "https://api.github.com/users/evanphx/repos",
        "events_url": "https://api.github.com/users/evanphx/events{/privacy}",
        "received_events_url": "https://api.github.com/users/evanphx/received_events",
        "type": "User",
        "site_admin": false
      },
      {
        "login": "vanpelt",
        "id": 17,
        "node_id": "MDQ6VXNlcjE3",
        "avatar_url": "https://avatars.githubusercontent.com/u/17?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/vanpelt",
        "html_url": "https://github.com/vanpelt",
        "followers_url": "https://api.github.com/users/vanpelt/followers",
        "following_url": "https://api.github.com/users/vanpelt/following{/other_user}",
        "gists_url": "https://api.github.com/users/vanpelt/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/vanpelt/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/vanpelt/subscriptions",
        "organizations_url": "https://api.github.com/users/vanpelt/orgs",
        "repos_url": "https://api.github.com/users/vanpelt/repos",
        "events_url": "https://api.github.com/users/vanpelt/events{/privacy}",
        "received_events_url": "https://api.github.com/users/vanpelt/received_events",
        "type": "User",
        "site_admin": false
      },
      {
        "login": "wayneeseguin",
        "id": 18,
        "node_id": "MDQ6VXNlcjE4",
        "avatar_url": "https://avatars.githubusercontent.com/u/18?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/wayneeseguin",
        "html_url": "https://github.com/wayneeseguin",
        "followers_url": "https://api.github.com/users/wayneeseguin/followers",
        "following_url": "https://api.github.com/users/wayneeseguin/following{/other_user}",
        "gists_url": "https://api.github.com/users/wayneeseguin/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/wayneeseguin/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/wayneeseguin/subscriptions",
        "organizations_url": "https://api.github.com/users/wayneeseguin/orgs",
        "repos_url": "https://api.github.com/users/wayneeseguin/repos",
        "events_url": "https://api.github.com/users/wayneeseguin/events{/privacy}",
        "received_events_url": "https://api.github.com/users/wayneeseguin/received_events",
        "type": "User",
        "site_admin": false
      }
    ]
    ''';

    // Decode the mock JSON data
    final List<dynamic> data = json.decode(mockJsonData);
    final List<UserDto> userDtos =
        data.map((json) => UserDto.fromJson(json)).toList();

    // Pagination logic
    int startIndex = (page - 1) * perPage;
    int endIndex = startIndex + perPage;

    if (startIndex >= userDtos.length) {
      return [];
    }

    final paginatedUserDtos = userDtos.sublist(
        startIndex, endIndex > userDtos.length ? userDtos.length : endIndex);

    return paginatedUserDtos.map((userDto) => userDto.toDomain()).toList();
  }
}
