import 'package:flutter/material.dart';

// TODO サムネイルのスクレイピング？
Widget thumbnailSection() {
  return Container(

  );
}

Widget detailSection() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildDetail(),
      ],
    ),
  );
}

Widget buildDetail() {
    '開催日時': changeTimeFormat(event.startedAt), changeTimeFormat(event.endedAt),
    '会場': event.place,
    '会場の所在地': event.address,
  };

  // ISO-8601形式を「○○/○○/○○/○○:○○」に変換
  String changeTimeFormat(String before) {

    final datetime = DateTime.parse(before);
    final formatter = DateFormat('yyyy/MM/dd HH:mm');
    final formatted = formatter.format(datetime);
    return formatted;
  }
}