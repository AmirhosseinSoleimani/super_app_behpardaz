import 'package:flutter/material.dart';
import 'package:super_app_behpardaz/src/shared/ui_kit/loading_widget/loading_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String? url;
  final String? title;
  static const webViewScreenPath = '/web-view';
  static const webViewScreenName = 'web-view';

  const WebViewPage({super.key, required this.url, required this.title});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
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
      ..loadRequest(Uri.parse(widget.url ?? 'emdad.behpardaz.net'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title ?? '', style: Theme.of(context).textTheme.titleMedium,),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            LoadingWidget(color: Theme.of(context).colorScheme.onPrimary,),
        ],
      ),
    );
  }
}