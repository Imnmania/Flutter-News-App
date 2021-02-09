import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  //
  final String blogUrl;
  ArticleView({@required this.blogUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter'),
            Text(
              'News',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            Text(
              'App',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ],
        ),
        actions: [
          Opacity(
            opacity: 0.0,
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(Icons.save),
                onPressed: null,
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: (WebViewController webViewController) {
            _completer.complete(webViewController);
          },
        ),
      ),
    );
  }
}
