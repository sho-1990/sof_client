import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    title: Text("Post"),
  ),
];


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