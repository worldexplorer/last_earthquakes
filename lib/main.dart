import 'package:flutter/material.dart';

import 'views/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Earthquakes',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        highlightColor: Colors.blue,
      ),
      home: const Tabs(),
    );
  }
}
