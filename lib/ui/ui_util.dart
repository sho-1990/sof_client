import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sof_app/my_theme.dart';
import 'package:sof_app/ui/reload_button.dart';

get circleIndicator =>
    defaultTargetPlatform == TargetPlatform.iOS
        ? CupertinoActivityIndicator()
        : CircularProgressIndicator();

get bottomNavigationBarItems => <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.person),
    title: Text("Answers"),
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.speaker_notes),
    title: Text("Posts"),
  ),
];

Widget errorWidget(ThemeData themeData, Function onPressed) {
  return Container(
    alignment: Alignment.center,
    child: ReloadButton(
      onPressed: onPressed,
      buttonColorOnAndroid: themeData.accentColor,
      buttonColorOniOS: iOSButtonColor,),
  );
}


void setupPortrait() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, DeviceOrientation.portraitDown
  ]);
}

void setupPortraitAndLandscape() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, DeviceOrientation.portraitDown, DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight
  ]);
}