import 'package:flutter/material.dart';
import 'package:hotel_app/src/pages/_home_page.dart';
import 'package:hotel_app/src/pages/login_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Palomar',
      home: LoginPage(),
    );
  }
}