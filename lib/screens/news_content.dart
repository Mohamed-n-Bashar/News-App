import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsContent extends StatefulWidget {
  const NewsContent({super.key, required this.newsContent});
  final String newsContent;

  @override
  State<NewsContent> createState() => _NewsContentState();
}

class _NewsContentState extends State<NewsContent> {
//--------------------------------------------------------------------------------------------------------------
  var loadingPercentage = 0;
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse(widget.newsContent),
      );
  }

//--------------------------------------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            WebViewWidget(
              controller: _controller,
            ),
            if (loadingPercentage < 100)
              Center(
                child: CircularProgressIndicator(
                  value: loadingPercentage / 100.0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
