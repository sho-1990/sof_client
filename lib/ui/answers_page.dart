import 'package:flutter/material.dart';
import 'package:sof_app/data/sof/sof_answer_data.dart';
import 'package:sof_app/modules/sof_answers_presenter.dart';
import 'package:sof_app/my_theme.dart';
import 'package:sof_app/ui/platform_button.dart';
import 'package:sof_app/ui/ui_util.dart' as uiUtil;

class AnswersPage extends StatelessWidget {

  SofAnswersPresenter _sofAnswersPresenter = SofAnswersPresenter();

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
        List<Item> answerItems = snapshot.data;
        return Container(
          child: Column(
            children: <Widget>[
              Flexible(
                child: ListView.builder(
                  itemCount: answerItems.length,
                  itemBuilder: (context, index) {
                    return _getListItemUi(answerItems[index]);
                  },),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _loadErrorWidget(ThemeData themeData) {
    return Center(
      child: PlatformButton(
        text: "Reload",
        onPressed: () {
          _sofAnswersPresenter.loadAnswers();
        },
        buttonColorOnAndroid: themeData.accentColor,
        buttonColorOniOS: iOSButtonColor,),
    );
  }


  Widget _getListItemUi(Item answerItem) {
    return Column(
      children: <Widget>[
        Divider(),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Image.network(answerItem.owner.profileImage),
          ),
          title: Text(answerItem.owner.displayName, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("reptation: ${answerItem.owner.reputation}"),
          onTap: () {
            // call webview
          },
        ),
      ],
    );
  }
}
