import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/presentation/component/animation/list_animator.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../component/component.dart';
import '../home/homeViewModel.dart';
import 'widget/gridViewCategory.dart';

class Category extends StatefulWidget {
  const Category({Key? key, this.isViewAll, required this.whichType}) : super(key: key);
final bool ? isViewAll;
final String  whichType;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  Future<void> _loadData(BuildContext context) async {
    await Provider.of<HomeViewModel>(context, listen: false).getDepartments(context,);
  }
@override
  void initState() {
    super.initState();
    _loadData(context);
  }
  @override
  Widget build(BuildContext context) {
    return
      CustomScaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.sections.tr(),
          color: Colors.transparent,
          isBackButtonExist: false,
        ),
        body:Consumer<HomeViewModel>(
            builder: (context, data, child) => RefreshIndicator(
            onRefresh: () async => await _loadData(context),
    child: ScreenStateLayout(
    isLoading: data.departmentsModel == null,
    isEmpty:data.departmentsModel?.data?.isEmpty??true ,
    builder: (context) => Padding(
        padding: EdgeInsets.all(16.r),
        child: GridViewCategories(whichType: widget.whichType,),
      ),))));
  }
}
