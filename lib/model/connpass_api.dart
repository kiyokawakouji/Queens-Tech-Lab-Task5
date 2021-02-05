 // APIコール部分 json.decode
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_queens_tech_lab_task5/model/event_repository.dart';
// import 'package:flutter_queens_tech_lab_task5/view/body.dart';

 Future<List<ConnpassRepository>> getEvents(String searchWord) async {
   final response = await http.get('https://connpass.com/api/v1/event/?count=100&order=1&keyword=$searchWord');
   if (response.statusCode == 200) {
     final list = <ConnpassRepository>[];
     final Map<String, dynamic> decoded = json.decode(response.body);
     for (final item in decoded['items']) {
       list.add(ConnpassRepository.fromJson(item));
     }
     return list;
   } else {
     throw Exception('Fail to search repository');
   }
 }