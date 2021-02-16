import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_queens_tech_lab_task5/model/event_response.dart';

part 'event_response.freezed.dart';
part 'event_response.g.dart';

@freezed
abstract class ConnpassResponse with _$ConnpassResponse {
  const factory ConnpassResponse({
    final int eventId,
    final String title,
    final String catchMessage,
    final String description,
    final String eventUrl,
    final String hashTag,
    final String startedAt,
    final String endedAt,
    final int limit,
    final String eventType,
    final String address,
    final String place,

    List<ConnpassResponse> events
  }) = _ConnpassResponse;

  factory ConnpassResponse.fromJson(Map<String, dynamic> json) => _$ConnpassResponseFromJson(json);
}