import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ReloadButton extends StatelessWidget {

  final String title = "Reload";
  final VoidCallback onPressed;
  final Color buttonColorOnAndroid;
  final Color buttonColorOniOS;

  const ReloadButton({Key key,
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
        child: _createChild(),
        onPressed: onPressed,
        color: buttonColorOniOS,
      );
    } else {
      return FlatButton(
        child: _createChild(),
        onPressed: onPressed,
        color: buttonColorOnAndroid,
      );
    }
  }

  Widget _createChild() {
    return Container(child: Text(title),);
  }
}
