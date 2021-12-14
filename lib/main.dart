import 'package:flutter/material.dart';
import 'package:word_board_app/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Word Board',
      theme: ThemeData(
        primaryColor: Colors.amber[700],
      ),
      home: const HomeScreen(),
    );
  }
}
