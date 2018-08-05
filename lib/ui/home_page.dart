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
  var _bottomNavigationBarItems = uiUtil.bottomNavigationBarItems;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return _mainWidget();
        }
        return _cardWidget();
      },
    );
  }

  Widget _mainWidget() {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sof Client"),
          elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.1 : 5.0,
        ),
        body: _selectingWidget(),
        bottomNavigationBar: _bottomNavigationBar()
    );
  }

  Widget _cardWidget() {
    return Scaffold(
        body: AnimatedOpacity(
          opacity: 1.0,
          duration: Duration(milliseconds: 500),
          child: Container(
            color: Colors.black,
            child: Center(
              child: Text("landscape!", style: TextStyle(color: Colors.white),),
            ),
          ),
        )
    );
  }

  Widget _selectingWidget() {
    switch (_currentIndex) {
      case 0:
        uiUtil.setupPortrait();
        return AnswersPage();
      case 1:
        uiUtil.setupPortraitAndLandscape();
        return Center(
          child: Text("comming soon"),
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
