import 'package:flutter/material.dart';
import 'package:flutter_queens_tech_lab_task5/view/body.dart';
import 'package:flutter_queens_tech_lab_task5/model/api.dart';
import 'package:flutter_queens_tech_lab_task5/model/connpass_response.dart';
import 'package:flutter_queens_tech_lab_task5/model/event_response.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchQuery = TextEditingController();
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      final maxScrollExtent = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;
      if (maxScrollExtent > 0 && (maxScrollExtent - 20.0) <= currentPosition) {
        // TODO pagination
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final response = context.select<MainViewModelData, ConnpassResponse>((data) => data.response);
    final state = context.select<MainViewModelData, MainViewModelState>((data) => data.viewModelState);
    // ignore: lines_longer_than_80_chars
    final List<ConnpassResponse> eventList = response != null ? response.items : [];

    var body = eventList.isNotEmpty ?
      ListView(
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        children: eventList
            .map((event) => Card(
            child: ListTile(
              title: Text(
                event.volumeInfo.title,
              ),
              subtitle: Text(
                event.volumeInfo.description != null
                    ? event.volumeInfo.description
                    : '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => _launchURL(event.volumeInfo.infoLink),
            )))
            .toList())
        : const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'ここに検索結果を表示する',
          style: TextStyle(fontSize: 19),
          textAlign: TextAlign.center,
        ),
      ),
    );

    if (state == MainViewModelState.loading) {
      body = const Center(child: CircularProgressIndicator(),);
    } else if (state == MainViewModelState.error) {
      body = const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          // ignore: lines_longer_than_80_chars
          child: Text('エラーが発生しました。検索ワードを変えてお試しください', style: TextStyle(fontSize: 19), textAlign: TextAlign.center,),
        ),);
    }

    return Scaffold(
      appBar: AppBar(
        title: TextField(
            controller: _searchQuery,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: const InputDecoration(
              labelText: '検索バー',
              hintText: ' 例: 東京 Flutter ',
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              hintStyle: TextStyle(
                color: Colors.white,
              ),
            )
        ),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search), onPressed:() {
            context.read<MainViewModel>().fetch(_searchQuery.text);
          })
        ],
      ),
      body: body,
    );
  }
}

 // ブラウザで開く
_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    // ignore: only_throw_errors
    throw 'Could not launch $url';
  }
}