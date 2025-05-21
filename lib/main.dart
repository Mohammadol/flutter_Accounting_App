import 'package:flutter/material.dart';
import 'package:accounting/pages/home_init.dart';
import 'package:accounting/pages/user_page.dart';
import 'package:accounting/pages/Loading.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeInit(),
        '/Loading': (context) => Loading(),
        '/User':(context)=> UserPage(),
      },
    );
  }
}







