// import 'package:adhmn/domain/entities/drop_down_entity.dart';
// import 'package:adhmn/domain/logger.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:provider/provider.dart';
//
// import '../../../core/resources/values_manager.dart';
// import '../../../generated/locale_keys.g.dart';
// import '../../component/component.dart';
// import '../widgets/sheet_header.dart';
// import 'city_reason_picker_view_model.dart';
//
// class CityPickerSheet extends StatefulWidget {
//   final List<DropDownEntity> defaultList;
//   final DropDownEntity? defaultValue;
//   final bool isMultiChoice;
//
//   const CityPickerSheet({Key? key,
//     required this.defaultList,
//     required this.defaultValue,
//     required this.isMultiChoice,
//   }) : super(key: key);
//
//   @override
//   State<CityPickerSheet> createState() => _CityPickerSheetState();
// }
//
// class _CityPickerSheetState extends State<CityPickerSheet> {
//   final tag = 'BrandPickerViewModel';
//   late CityPickerViewModel pickerViewModelProvider;
//
//   @override
//   void initState() {
//     super.initState();
//
//     pickerViewModelProvider = Provider.of<CityPickerViewModel>(context, listen: false);
//     pickerViewModelProvider.initVieModel(widget.defaultValue) ;
//     pickerViewModelProvider.getList(context,false);
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CityPickerViewModel>(
//       builder: (context, provider, child) {
//         pickerViewModelProvider = provider;
//         return Container(
//           margin: const EdgeInsets.only(top: 40),
//           padding: const EdgeInsets.only(bottom: 32, top: 4),
//           decoration:  BoxDecoration(
//               borderRadius:const BorderRadius.vertical(top: Radius.circular(20)),
//               color: Theme.of(context).scaffoldBackgroundColor),
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 SheetHeader(
//                   isMultiChoice:  widget.isMultiChoice,
//                   confirmText: tr(LocaleKeys.confirm),
//                   title: tr(LocaleKeys.cities),
//                   onCancelPress: () => Navigator.pop(context),
//                   onConfirmPressed: () => Navigator.pop(context, widget.isMultiChoice ? provider.selectedList : provider.selected)
//                 ),
//                 const Divider(height: 8),
//                 ScreenStateLayout(
//                   isLoading: provider.responseModel == null,
//                   error:  provider.responseModel?.error,
//                   isEmpty: ( provider.responseModel?.data?.length??0)==0,
//                   onRetry: () => pickerViewModelProvider.getList(context,true),
//                   builder: (context) =>
//                         buildBody(
//                             context,
//                             selectedItemIds: provider.selectedList!.map((e) => e.id).toList(),
//                             model: provider.responseModel?.data??[],
//                             selectedItem: provider.selected
//                         ),
//                 ),
//
//               ]),
//         );
//       },
//     );
//   }
//
//   Widget buildBody(BuildContext context,
//       {List<int?>? selectedItemIds,
//       required List<DropDownEntity> model,
//       DropDownEntity? selectedItem}) {
//     return model.isEmpty
//         ? const SizedBox.shrink()
//         : Container(
//             constraints: BoxConstraints(
//               maxHeight: deviceHeight / 2,
//             ),
//             child: ListView(
//                 shrinkWrap: true,
//                 children: model
//                     .map((e) => widget.isMultiChoice
//                         ? buildMultiChoiceItem(context, selectedItemIds, e)
//                         : buildSingleChoiceItem(context, selectedItem, e))
//                     .toList()),
//           );
//   }
//
//   Widget buildMultiChoiceItem(BuildContext context, List<int?>? selectedCityIds, DropDownEntity model) {
//     return CheckboxListTile(
//       value: selectedCityIds!.contains(model.id),
//       onChanged: (b) => pickerViewModelProvider.onItemChecked(
//           isChecked: b!, selectedItem: model),
//       title: Text(
//         model.title,
//         style: Theme.of(context).textTheme.caption!.copyWith(
//           fontSize: 15.5,
//         ),
//       ),
//     );
//   }
//
//   Widget buildSingleChoiceItem(BuildContext context, DropDownEntity? selectedItem, DropDownEntity model) {
//     log(tag, 'selectedModel = ${selectedItem?.title}');
//     return RadioListTile<int>(
//
//       groupValue: selectedItem?.id,
//       title: Text(model.title),
//       value: model.id,
//       onChanged: (value) {
//         log(tag, 'on dashboard_item selected');
//         pickerViewModelProvider.onSelected(model);
//       },
//     );
//   }
// }
//
// Future<dynamic> showCityPicker(BuildContext context,
//     {required List<DropDownEntity> defaultList,
//     required DropDownEntity? defaultValue,
//     required bool isMultiChoice}) async {
//   return showMaterialModalBottomSheet(
//     expand: false,
//     context: context,
//     backgroundColor: Colors.transparent,
//     builder: (context) => SafeArea(
//         child: CityPickerSheet(
//       defaultList: defaultList,
//       defaultValue: defaultValue,
//       isMultiChoice: isMultiChoice,
//     )),
//   );
// }
