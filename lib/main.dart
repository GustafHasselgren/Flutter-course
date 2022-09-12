import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/error_notifier.dart';
import './mainView.dart';
import './filter_change_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FilterChangeNotifier()),
        ChangeNotifierProvider(create: (context) => ErrorNotifier())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'To-do',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.blueGrey[700],
            textTheme: TextTheme(
              bodyText2: TextStyle(fontSize: 15.0, color: Colors.blueGrey[100]),
            ),
          ),
          home: const MainView()),
    );
  }
}
