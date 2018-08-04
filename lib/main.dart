import 'package:flutter/material.dart';
import 'package:sof_app/dependency_injection.dart';
import 'package:sof_app/my_theme.dart';
import 'package:sof_app/ui/home_page.dart';

void main() {
  runApp(App(flavor: Flavor.PROD,));
}

class App extends StatelessWidget {

  final Flavor flavor;

  const App({Key key, @required this.flavor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Injector.configure(flavor ?? Flavor.PROD);
    return MaterialApp(
      theme: myTheme,
      home: HomePage()
    );
  }
}
