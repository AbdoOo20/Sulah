// import 'dart:async';
//
// import 'package:adhmn/domain/entities/drop_down_entity.dart';
// import 'package:adhmn/domain/logger.dart';
// import 'package:flutter/material.dart';
//
// import '../../../data/datasource/remote/exception/error_widget.dart';
// import '../../../data/model/base/response_model.dart';
// import '../../../domain/usecase/setting/get_cities_usecase.dart';
//
// class CityPickerViewModel with ChangeNotifier {
//
//   final GetCitiesUseCase _getCitiesUseCase;
//   CityPickerViewModel({
//     required GetCitiesUseCase getCitiesUseCase,
//   }) : _getCitiesUseCase = getCitiesUseCase;
//
//
//
//   final tag = 'CityPickerViewModel';
//   ResponseModel<List<DropDownEntity>>? _responseModel;
//   ResponseModel<List<DropDownEntity>>? get responseModel => _responseModel;
//
//   ErrorModel? _error;
//   ErrorModel? get error => _error;
//   List<DropDownEntity>? selectedList = [];
//   DropDownEntity? selected;
//
//   initVieModel(DropDownEntity? defaultValue) {
//     selected = defaultValue;
//   }
//
//   Future<void> getList(BuildContext context, bool reload) async {
//     if (reload) {
//       notifyListeners();
//     }
//     _responseModel = await _getCitiesUseCase.call();
//
//     notifyListeners();
//   }
//
//   void onItemChecked({required bool isChecked, required DropDownEntity selectedItem}) {
//     log(tag, 'onItemChecked: isChecked= $isChecked id= $selectedItem');
//     if (isChecked) {
//       log(tag, 'onItemChecked: add');selectedList!.add(selectedItem);
//     } else {
//       log(tag, 'onItemChecked: remove');selectedList!.removeWhere((item) => item.id == selectedItem.id);
//     }
//     selectedList = [...selectedList!];
//     notifyListeners();
//   }
//
//   void onSelected(DropDownEntity value) {
//     log(tag, 'onSelected: $value');
//
//     selected = value;
//     notifyListeners();
//   }
// }
