import 'dart:async';
import 'package:sof_app/data/exception/fetch_data_exception.dart';

import 'sof_answer_data.dart';

class MockSofAnswersRepository implements SofAnswersRepository {

  final items = <Item>[
    Item(owner: Owner(
        reputation: 490,
        userId: 6775560,
        userType: "registered",
        profileImage: "https://www.gravatar.com/avatar/6a58c4e4004e0b4aa7d08a1d7cdd0b14?s=128&d=identicon&r=PG",
        displayName: "Rodrigo Mata",
        link: "https://stackoverflow.com/users/6775560/rodrigo-mata"),
      isAccepted: false,
      score: 0,
      lastActivityDate: DateTime.fromMillisecondsSinceEpoch(1532442806),
      creationDate: DateTime.fromMillisecondsSinceEpoch(1532442806),
      answerId: 51501276,
      questionId: 51499807
    ),
    Item(owner: Owner(
        reputation: 490,
        userId: 6775560,
        userType: "registered",
        profileImage: "https://www.gravatar.com/avatar/6a58c4e4004e0b4aa7d08a1d7cdd0b14?s=128&d=identicon&r=PG",
        displayName: "Rodrigo Mata2",
        link: "https://stackoverflow.com/users/6775560/rodrigo-mata"),
        isAccepted: false,
        score: 0,
        lastActivityDate: DateTime.fromMillisecondsSinceEpoch(1532442806),
        creationDate: DateTime.fromMillisecondsSinceEpoch(1532442806),
        answerId: 51501276,
        questionId: 51499807
    )
  ];


  @override
  Future<List<Item>> fetchAnswers() async {
    return Future.delayed(const Duration(seconds: 3), () => items);
  }
}
