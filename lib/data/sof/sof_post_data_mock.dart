import 'dart:async';

import 'package:sof_app/data/sof/data/owner.dart';
import 'package:sof_app/data/sof/sof_post_data.dart';

class MockSofPostsRepository implements SofPostsRepository {

  final items = <Post>[
    Post(
      owner: Owner(
          reputation: 490,
          userId: 6775560,
          userType: "registered",
          profileImage: "https://www.gravatar.com/avatar/6a58c4e4004e0b4aa7d08a1d7cdd0b14?s=128&d=identicon&r=PG",
          displayName: "Rodrigo Mata",
          link: "https://stackoverflow.com/users/6775560/rodrigo-mata"),
      score: 0,
      lastEditDate: DateTime.fromMillisecondsSinceEpoch(1532442806),
      lastActivityDate: DateTime.fromMillisecondsSinceEpoch(1532442806),
      creationDate: DateTime.fromMillisecondsSinceEpoch(1532442806),
      postType: "question",
      postId: 51677676,
      link: "https://stackoverflow.com/q/51677676"
    ),
    Post(
        owner: Owner(
            reputation: 490,
            userId: 6775560,
            userType: "registered",
            profileImage: "https://www.gravatar.com/avatar/6a58c4e4004e0b4aa7d08a1d7cdd0b14?s=128&d=identicon&r=PG",
            displayName: "Rodrigo Mata",
            link: "https://stackoverflow.com/users/6775560/rodrigo-mata"),
        score: 0,
        lastEditDate: DateTime.fromMillisecondsSinceEpoch(1532442806),
        lastActivityDate: DateTime.fromMillisecondsSinceEpoch(1532442806),
        creationDate: DateTime.fromMillisecondsSinceEpoch(1532442806),
        postType: "question",
        postId: 51677676,
        link: "https://stackoverflow.com/q/51677676"
    ),
    Post(
        owner: Owner(
            reputation: 490,
            userId: 6775560,
            userType: "registered",
            profileImage: "https://www.gravatar.com/avatar/6a58c4e4004e0b4aa7d08a1d7cdd0b14?s=128&d=identicon&r=PG",
            displayName: "Rodrigo Mata",
            link: "https://stackoverflow.com/users/6775560/rodrigo-mata"),
        score: 0,
        lastEditDate: DateTime.fromMillisecondsSinceEpoch(1532442806),
        lastActivityDate: DateTime.fromMillisecondsSinceEpoch(1532442806),
        creationDate: DateTime.fromMillisecondsSinceEpoch(1532442806),
        postType: "question",
        postId: 51677676,
        link: "https://stackoverflow.com/q/51677676"
    ),
  ];

  @override
  Future<List<Post>> fetchPosts() {
    return Future.delayed(const Duration(seconds: 3), () => this.items);
  }

}