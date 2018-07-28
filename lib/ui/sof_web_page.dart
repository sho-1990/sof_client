import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class WebPage extends StatefulWidget {

  final url;

  const WebPage({Key key, this.url}) : super(key: key);

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {

  final plugin = FlutterWebviewPlugin();
  var _webviewTitle = "";

  @override
  void dispose() {
    super.dispose();
    plugin.close();
  }

  @override
  Widget build(BuildContext context) {

    plugin.onStateChanged.listen((WebViewStateChanged state) async {
      if (state.type == WebViewState.finishLoad) {
        var title = await plugin.evalJavascript("document.title");
        setState(() {
          _webviewTitle = title;
        });
      }
    });

    return WebviewScaffold(
      url: widget.url,
      withJavascript: true,
      withZoom: true,
      appBar: AppBar(
        title: Text(_webviewTitle),
      ),
    );
  }
}

