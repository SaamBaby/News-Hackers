import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hacker_news/ui/pages/root.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarBrightness: Brightness.dark, statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backwardsCompatibility: false, // 1
        ),
      ),
      home: const Root(),
    );
  }
}


