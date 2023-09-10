import 'package:flutter/material.dart';
import 'package:sentiment_test/mainScreen.dart';
import 'package:sentiment_test/resultScreen.dart';

void main() => runApp(SentimentApp());

class SentimentApp extends StatelessWidget {
  const SentimentApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: Color(0xff0a0e21)),
        scaffoldBackgroundColor: Color(0xff0a0e21),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Sentiment App',
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/first': (context) => ResultScreen(),
      },
    );
  }
}
