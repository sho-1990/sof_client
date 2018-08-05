import 'package:flutter/material.dart';
import 'package:sof_app/data/sof/sof_answer_data.dart';
import 'package:sof_app/modules/sof_answers_presenter.dart';
import 'package:sof_app/my_theme.dart';
import 'package:sof_app/ui/navigation_util.dart';
import 'package:sof_app/ui/reload_button.dart';
import 'package:sof_app/ui/sof_web_page.dart';
import 'package:sof_app/ui/ui_util.dart' as uiUtil;

class AnswersPage extends StatelessWidget {

  final SofAnswersPresenter _sofAnswersPresenter = SofAnswersPresenter();

  @override
  Widget build(BuildContext context) {
    return _answersWidget();
  }

  Widget _answersWidget() {
    return StreamBuilder(
      stream: _sofAnswersPresenter.itemStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return _loadErrorWidget(Theme.of(context));
        }
        if (!snapshot.hasData) {
          _sofAnswersPresenter.loadAnswers();
          return Center(
              child: uiUtil.circleIndicator
          );
        }
        List<Answer> answerItems = snapshot.data;
        return Container(
          child: Column(
            children: <Widget>[
              Flexible(
                child: ListView.builder(
                  itemCount: answerItems.length,
                  itemBuilder: (context, index) {
                    return _getListItemUi(answerItems[index], context);
                  },),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _loadErrorWidget(ThemeData themeData) {
    return uiUtil.errorWidget(themeData, () {
      _sofAnswersPresenter.loadAnswers();
    });
  }


  Widget _getListItemUi(Answer answerItem, BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Image.network(answerItem.owner.profileImage),
          ),
          title: Text(answerItem.owner.displayName, style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("reptation: ${answerItem.owner.reputation}"),
          trailing: FlatButton(
            child: Text("detail"),
            onPressed: () {
              _openWeb(context, answerItem.owner.link);
            },
          ),
          onTap: () {
            _openWeb(context, answerItem.owner.link);
          },
        ),
        Divider(),
      ],
    );
  }

  void _openWeb(BuildContext context, String url) {
    openWeb(context, url);
  }
}
