import 'package:flutter/material.dart';

import 'presentation/home_page.dart';
void main() {
  // setupMainDeps();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'To-do List',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '$HomePage',
        routes: {
          '$HomePage': (_) => const HomePage(),
        }
    );
  }
}
