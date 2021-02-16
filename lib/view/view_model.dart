import 'package:state_notifier/state_notifier.dart';
import 'package:flutter_queens_tech_lab_task5/model/connpass_api.dart';
import 'package:flutter_queens_tech_lab_task5/view/view_model_data.dart';

 // StateNotifierの実装
class ViewModel extends StateNotifier<ViewModelData> {
  ViewModel(): super(const ViewModelData());

  void fetch(String keyword) {
    state = state.copyWith(viewModelState: ViewModelState.loading);
    getEvents(keyword)
        .then((res) {
      state = state.copyWith(response: res, viewModelState: ViewModelState.normal);
    }).catchError((_) {
      state = state.copyWith(response: null, viewModelState: ViewModelState.error);
    });
  }
}