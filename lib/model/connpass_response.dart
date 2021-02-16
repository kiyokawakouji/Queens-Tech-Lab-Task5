import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connpass_response.freezed.dart';
part 'connpass_response.g.dart';

@freezed
abstract class ConnpassResponse with _$ConnpassResponse {
  const factory ConnpassResponse({
    final int resultsReturned,
    final int resultsAvailable,
    final int resultsStart,
    List<ConnpassResponse> events
  }) = _ConnpassResponse;

  factory ConnpassResponse.fromJson(Map<String, dynamic> json) => _$ConnpassResponseFromJson(json);
}