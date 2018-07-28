import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final Color buttonColorOnAndroid;
  final Color buttonColorOniOS;

  const PlatformButton({Key key,
    @required this.text,
    @required this.onPressed,
    @required this.buttonColorOnAndroid,
    @required this.buttonColorOniOS}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _button();
  }

  Widget _button() {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoButton(
        child: Center(child: Text(text),),
        onPressed: onPressed,
        color: buttonColorOniOS,
      );
    } else {
      return FlatButton(
        child: Center(child: Text(text),),
        onPressed: onPressed,
        color: buttonColorOnAndroid,
      );
    }
  }
}
