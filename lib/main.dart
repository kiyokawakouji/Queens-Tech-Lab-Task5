import 'package:flutter/material.dart';
import 'package:flutter_queens_tech_lab_task5/view/body.dart';
import 'package:flutter_queens_tech_lab_task5/view/event_list.dart';
import 'package:freezed/builder.dart';


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
      initialRoute: '/',
      routes: {
         '/': (context) => EventList(),
        '/body': (context) => MyApp(),
      },
    );
  }
}

