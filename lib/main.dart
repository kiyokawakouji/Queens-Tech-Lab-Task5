import 'package:flutter/material.dart';
import 'package:flutter_queens_tech_lab_task5/view/body.dart';
import 'package:flutter_queens_tech_lab_task5/model/connpass_api.dart';
import 'package:flutter_queens_tech_lab_task5/model/connpass_repository.dart';
import 'package:flutter_queens_tech_lab_task5/model/event_repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connpass Search App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),   // 最初に表示させたいページを「/」で定義
      },
    );
  }
}

