import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sof_app/ui/sof_web_page.dart';

void openWeb(BuildContext context, String url) {
  Navigator.of(context).push(
      MaterialPageRoute(
          builder: (BuildContext context) {
            return WebPage(url: url);
          }
      )
  );
}