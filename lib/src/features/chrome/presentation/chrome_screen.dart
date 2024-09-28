import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChromeScreen extends StatefulWidget {
  static const chromeScreenPath = '/chrome-screen';
  static const chromeScreenName = 'chrome-screen';
  const ChromeScreen({super.key});

  @override
  State<ChromeScreen> createState() => _ChromeScreenState();
}

class _ChromeScreenState extends State<ChromeScreen> {

  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.google.com'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Search'),
        centerTitle: true,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
