/*

1ページ目
TextFieldで検索フォームを作成
subimissionで検索実行ボタンを作成

 */
import 'package:flutter/material.dart';
import 'package:pedantic_mono/pedantic_mono.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formKey = GlobalKey<FormState>();
  String _word = '';

  Widget build(BuildContext context) {
  return Form(
      key: _formKey,
      child: Container(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: <Widget>[
              new TextFormField(
                enabled: true,
                maxLength: 30,
                maxLengthEnforced: false,
                obscureText: false,
                autovalidate: false,
                decoration: const InputDecoration(
                  hintText: '*例: 東京 Flutter',
                ),
                validator: (String value) {
                  return value.isEmpty ? '必須入力です' : null;
                },
                onSaved: (String value) {
                  this._word = value;
                },
              ),
              ),
              RaisedButton(
                onPressed: _submission,
                child: Text('検索'),
              )
            ],
          )
      )
  );
}

void _submission() {
  if (this._formKey.currentState.validate()) {
    this._formKey.currentState.save();
    Scaffold
        .of(context)
        .showSnackBar(SnackBar(content: Text('Processing Data')));
    print(this._word);
  }
 }
}
