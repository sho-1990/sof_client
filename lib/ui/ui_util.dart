import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

get circleIndicator =>
    defaultTargetPlatform == TargetPlatform.iOS
        ? CupertinoActivityIndicator()
        : CircularProgressIndicator();