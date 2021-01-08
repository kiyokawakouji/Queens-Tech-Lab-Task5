import 'package:flutter/material.dart';
import 'home/body.dart';
import 'package:pedantic_mono/pedantic_mono.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_queens_tech_lab_task5',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'connpass event search app'),
    );
  }
}

