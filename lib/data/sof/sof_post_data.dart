import 'dart:async';

import 'package:sof_app/data/sof/data/owner.dart';

class Post {
  Owner owner;
  int score;
  DateTime lastEditDate;
  DateTime lastActivityDate;
  DateTime creationDate;
  String postType;
  int postId;
  String link;

  Post({
    this.owner,
    this.score,
    this.lastEditDate,
    this.lastActivityDate,
    this.creationDate,
    this.postType,
    this.postId,
    this.link
  });

  Post.fromMap(Map<String, dynamic> map) {
    owner = Owner.fromMap(map['owner']);
    score = map['score'];
    if (map.containsKey('last_edit_date')) {
      lastEditDate = DateTime.fromMillisecondsSinceEpoch(map['last_edit_date']);
    }
    lastActivityDate = DateTime.fromMillisecondsSinceEpoch(map['last_activity_date']);
    creationDate = DateTime.fromMillisecondsSinceEpoch(map['creation_date']);
    postType = map['post_type'];
    postId = map['post_id'];
    link = map['link'];
  }


}

abstract class SofPostsRepository {
  Future<List<Post>> fetchPosts();
}