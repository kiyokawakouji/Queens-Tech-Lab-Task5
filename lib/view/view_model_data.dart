import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_queens_tech_lab_task5/model/connpass_response.dart';

part 'view_model_data.freezed.dart';

 // StateNotifierが管理するState
 // View側で使うレスポンス、状態を通知するEnumを定義。
enum ViewModelState { normal, loading, error }

@freezed
abstract class ViewModelData with _$ViewModelData {
  const factory ViewModelData({
    ConnpassResponse response,
    ViewModelState viewModelState
  }) = _ViewModelData;
}