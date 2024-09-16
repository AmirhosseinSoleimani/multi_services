import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    String apiKey = 'YOUR_NEWS_API_KEY'; // کلید API خود را جایگزین کنید
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=425404fed18049119c95cc60cdcc82f9';

    Dio dio = Dio();
    try {
      Response response = await dio.get(url);
      setState(() {
        articles = response.data['articles'];
        isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latest Technology News'),
      ),
      body: isLoading
          ? Center(
        child: SpinKitFadingCircle(
          color: Colors.blue,
          size: 50.0,
        ),
      )
          : ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          var article = articles[index];
          return ListTile(
            leading: article['urlToImage'] != null
                ? Image.network(
              article['urlToImage'],
              width: 100,
              fit: BoxFit.cover,
            )
                : null,
            title: Text(article['title'] ?? 'No title'),
            subtitle: Text(article['description'] ?? 'No description'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => WebViewPage(url: article['url']),
              ));
            },
          );
        },
      ),
    );
  }
}

class WebViewPage extends StatefulWidget {
  final String url;

  WebViewPage({required this.url});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (url) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView Example'),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
