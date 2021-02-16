import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter_queens_tech_lab_task5/view/body.dart';
import 'package:flutter_queens_tech_lab_task5/view/view_model_data.dart';
import 'package:flutter_queens_tech_lab_task5/view/view_model.dart';
import 'package:flutter_queens_tech_lab_task5/model/connpass_response.dart';
import 'package:flutter_queens_tech_lab_task5/model/event_response.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Book State Notifier Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StateNotifierProvider<ViewModel, ViewModelData>(
        create: (_) => ViewModel(),
        child: const MyHomePage(title: 'Connpass Event Search App'),
      ),
    );
  }
}

