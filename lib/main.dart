import 'package:flutter/material.dart';
import 'package:flutter_queens_tech_lab_task5/view/body.dart';
import 'package:flutter_queens_tech_lab_task5/view/event_list.dart';
import 'package:freezed/builder.dart';
import 'package:build_runner/build_runner.dart';
import 'package:flutter/foundation.dart';

part 'main.freezed.dart';

@freezed
abstract class Union with _$Union {
  const factory Union(int value) = Data;
  const factory Union.loading() = Loading;
  const factory Union.error([String message]) = ErrorDetails;
}


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
        '/': (context) => MyHomePage(),   // 最初に表示させたいページを「/」で定義
         '/event_list': (context) => EventList(),
      },
    );
  }
}

