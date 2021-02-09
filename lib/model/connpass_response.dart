import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_queens_tech_lab_task5/model/event_response.dart';

@freezed
abstract class ConnpassResponse with _$ConnpassResponse {
  const factory ConnpassResponse({
    String kind,
    int totalItems,
    List<ConnpassResponse> items
  }) = _ConnpassResponse;

  factory ConnpassResponse.fromJson(Map<String, dynamic> json) => _$ConnpassResponseFromJson(json);
}