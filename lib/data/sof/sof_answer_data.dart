import 'dart:async';

class Item {
  Owner owner;
  bool isAccepted = false;
  int score = 0;
  DateTime lastActivityDate;
  DateTime creationDate;
  int answerId;
  int questionId;

  Item({
    this.owner,
    this.isAccepted,
    this.score,
    this.lastActivityDate,
    this.creationDate,
    this.answerId,
    this.questionId
  });

  Item.fromMap(Map<String, dynamic> map)
    : owner = Owner.fromMap(map['owner']),
      isAccepted = map['is_accepted'],
      score = map['score'],
      lastActivityDate = DateTime.fromMillisecondsSinceEpoch(map['last_activity_date']),
      creationDate = DateTime.fromMillisecondsSinceEpoch(map['creation_date']),
      answerId = int.parse(map['answer_id']),
      questionId = int.parse(map['question_id']);
}

class Owner {
  int reputation;
  int userId;
  String userType;
  String profileImage;
  String displayName;
  String link;

  Owner({
    this.reputation,
    this.userId,
    this.userType,
    this.profileImage,
    this.displayName,
    this.link
  });

  Owner.fromMap(Map<String, dynamic> map)
    : reputation = map['reputation'],
      userId = map['user_id'],
      userType = map['user_id'],
      profileImage = map['profile_image'],
      displayName = map['display_name'],
      link = map['link'];
}

// dartにはinterfaceはなく、classを作成すると暗黙に作られる
abstract class SofAnswersRepository {
  Future<List<Item>> fetchAnswers();
}