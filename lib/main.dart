
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:universal_html/html.dart' as html;
import 'package:monei/uiFake/UiFake.dart' if (dart.library.html) 'dart:ui' as ui;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  bool showIframe = false;
  html.IFrameElement iframe = html.IFrameElement();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              InkWell(
                child: const Text('Hello World!'),
                onTap: () async {
                  await createStripeIframe();
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  child: (showIframe && kIsWeb) ? HtmlElementView(viewType: 'rzp-html') : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  createStripeIframe() async {
    showIframe = true;
    if(mounted) {
      setState(() {});
    }
    ui.platformViewRegistry.registerViewFactory("rzp-html",(int viewId) {
      iframe = html.IFrameElement();

      html.window.onMessage.forEach((element) async {

      });

      iframe.src='assets/scripts/stripe.html?amount=100';
      iframe.style.border = 'none';

      return iframe;
    });
  }
}
