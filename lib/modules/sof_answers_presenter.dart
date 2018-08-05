import 'dart:async';

import 'package:sof_app/data/sof/sof_answer_data.dart';
import 'package:sof_app/dependency_injection.dart';

class SofAnswersPresenter {
  SofAnswersRepository _sofAnswersRepository;

  var _itemStreamController = StreamController<List<Answer>>();

  get itemStream => _itemStreamController.stream;


  SofAnswersPresenter() {
    Injector injector = Injector();
    _sofAnswersRepository = injector.sofAnswersRepository;
  }

  Future loadAnswers() async {
    var items;
    try {
      items = await _sofAnswersRepository.fetchAnswers();
    } catch (e) {
      print(e);
      _itemStreamController.addError(e);
      return;
    }
    _itemStreamController.add(items);
  }
}