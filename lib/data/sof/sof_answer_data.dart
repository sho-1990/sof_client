import 'dart:async';

import 'package:sof_app/data/sof/data/owner.dart';

class Answer {
  Owner owner;
  bool isAccepted = false;
  int score = 0;
  DateTime lastActivityDate;
  DateTime creationDate;
  int answerId;
  int questionId;

  Answer({
    this.owner,
    this.isAccepted,
    this.score,
    this.lastActivityDate,
    this.creationDate,
    this.answerId,
    this.questionId
  });

  Answer.fromMap(Map<String, dynamic> map)
    : owner = Owner.fromMap(map['owner']),
      isAccepted = map['is_accepted'],
      score = map['score'],
      lastActivityDate = DateTime.fromMillisecondsSinceEpoch(map['last_activity_date']),
      creationDate = DateTime.fromMillisecondsSinceEpoch(map['creation_date']),
      answerId = map['answer_id'],
      questionId = map['question_id'];
}


// dartにはinterfaceはなく、classを作成すると暗黙に作られる
abstract class SofAnswersRepository {
  Future<List<Answer>> fetchAnswers();
}