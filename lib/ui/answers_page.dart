import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sof_app/data/sof/sof_answer_data.dart';
import 'package:sof_app/modules/sof_answers_presenter.dart';

class AnswersPage extends StatefulWidget {
  @override
  _AnswerPageState createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswersPage> implements AnswerListContract {

  SofAnswersPresenter _sofAnswersPresenter;
  Future<List<Item>> _answers;

  @override
  void initState() {
    super.initState();
    _sofAnswersPresenter = SofAnswersPresenter(this);
    _sofAnswersPresenter.loadAnswers();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("0"),);
  }

  @override
  void onGetAnswersSeed(Future<List<Item>> items) {
    debugPrint(items.toString());
  }
}
