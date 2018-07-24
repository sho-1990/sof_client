import 'dart:async';

import 'package:sof_app/data/sof/sof_answer_data.dart';
import 'package:sof_app/dependency_injection.dart';

abstract class AnswerListContract {
  void onGetAnswersSeed(Future<List<Item>> items);
}

class SofAnswersPresenter {
  AnswerListContract _view;
  SofAnswersRepository _sofAnswersRepository;

  SofAnswersPresenter(this._view) {
    Injector injector = Injector();
    _sofAnswersRepository = injector.sofAnswersRepository;
  }

  void loadAnswers() {
    var items = _sofAnswersRepository.fetchAnswers();
    _view.onGetAnswersSeed(items);
  }
}