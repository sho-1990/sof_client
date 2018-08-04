import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sof_app/ui/answers_page.dart';
import 'ui_util.dart' as uiUtil;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  var _bottomNavigationBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text("Answers"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.speaker_notes),
      title: Text("Post"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sof Client"),
        elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.1 : 5.0,
      ),
      body: _selectingWidget(),
      bottomNavigationBar: _bottomNavigationBar()
    );
  }

  Widget _selectingWidget() {
    switch (_currentIndex) {
      case 0:
        uiUtil.setupPortrait();
        return AnswersPage();
      case 1:
        uiUtil.setupPortraitAndLandscape();
        return OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return Center(child: Text("Comming Soon in portrait!"));
              } else {
                return Center(child: Text("Comming Soon in landscape!"),);
              }
            },
          );
      default:
        throw ArgumentError("invalid");
    }
  }

  Widget _bottomNavigationBar() {
    return defaultTargetPlatform == TargetPlatform.iOS ?
      CupertinoTabBar(
        currentIndex: _currentIndex,
        items: _bottomNavigationBarItems,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ) :
      BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: _bottomNavigationBarItems,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
    );
  }
}
