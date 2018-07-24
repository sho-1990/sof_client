import 'package:flutter/material.dart';
import 'package:sof_app/my_theme.dart';
import 'package:sof_app/ui/home_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      home: HomePage()
    );
  }
}
