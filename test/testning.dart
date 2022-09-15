import 'package:flutter/material.dart';
import '../lib/http_connection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    Future jsonObj = HttpConnection.fetchData();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MyApp'),
          backgroundColor: Colors.yellow,
        ),
        body: Column(children: [
          textPart('Hej'),
          textPart('Mårten'),
          textPart('August')
        ]),
      ),
    );
  }

  Widget textPart(String text) {
    return Row(
      children: [
        Spacer(),
        Text(text),
      ],
    );
  }
}
