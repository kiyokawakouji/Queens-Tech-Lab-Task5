import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formKey = GlobalKey<FormState>();
  String _word = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Container(
            padding: const EdgeInsets.all(50),
              child: Column(
                  children: <Widget>[
                      TextFormField(
                        enabled: true,
                        maxLength: 30,
                        maxLengthEnforced: false,
                        obscureText: false,
                        decoration: const InputDecoration(
                          hintText: '*例: 東京 Flutter',
                        ),
                        validator: (String value) {
                          return value.isEmpty ? '必須入力です' : null;
                        },
                        onSaved: (String value) {
                          _word = value;
                        },
                      ),
                        RaisedButton(
                         child: const Text('検索'),
                          onPressed: () {
                            _submission(context);
                          }
                        ),
                     ],
                  ),
              ),
  );
}

 // 次の画面へ値を渡す
void _submission(BuildContext context) {
  if (_formKey.currentState.validate()) {
    _formKey.currentState.save();
    // 実行したプロセスを画面下部に表示する
    Scaffold
        .of(context)
        .showSnackBar(const SnackBar(content: Text('Processing Data')));
    print(_word);
  }
 }
}
