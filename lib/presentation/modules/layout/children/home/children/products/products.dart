import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/presentation/modules/layout/children/home/children/products/productsViewModel.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/res/text_styles.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../../../../data/model/response/one_store_model.dart';

import '../../../../../../component/component.dart';
import '../../../../../../component/svg_icon.dart';
import '../../homeViewModel.dart';
import '../../widgets/CustomFloatingActionButton.dart';
import 'bottom_sheet_products/brand_sheet.dart';
import 'bottom_sheet_products/car_sheet.dart';
import 'bottom_sheet_products/department_sheet.dart';
import 'bottom_sheet_products/manufacture_year_sheet.dart';
import 'widget/gridView_Products.dart';
import 'widget/ListOfCat.dart';
import 'widget/CustomCard.dart';

class Productions extends StatefulWidget {
  const Productions({Key? key,  this.oneStore, this.isFrom})
      : super(key: key);
  final OneStore? oneStore;
  final String? isFrom;

  @override
  State<Productions> createState() => _ProductionsState();
}

class _ProductionsState extends State<Productions> {
  bool isInserted = false;
  int cardNumber = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<ProductsViewModel>(context, listen: false).searchController.text='';
    _loadData(context);
  }

  Future<void> _loadData(BuildContext context,) async {
    String title=Provider.of<ProductsViewModel>(context, listen: false).searchController.text;
    String departmentId=Provider.of<HomeViewModel>(context, listen: false).catIdSelected??'';
    Provider.of<ProductsViewModel>(context, listen: false)
        .getProducts(context, title, departmentId, widget.oneStore?.id.toString());
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    double isKeyBoredOpen = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
        key: _scaffoldKey,
        floatingActionButton: const CustomFloatingActionButton(),
        backgroundColor: AppColors.white,
        appBar:widget.isFrom=='home'?const CustomAppBar(): CustomAppBar(
          color: Colors.white,
          title: LocaleKeys.products.tr(),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: InkWell(
                  onTap: _openDrawer,
                  child: SVGIcon(Assets.filter, width: 40.w, height: 40.h)),
            )
          ],
        ),
        drawer:  CustomDrawer(storeId:widget.oneStore?.id.toString()),
        body: Consumer<ProductsViewModel>(
            builder: (context, data, child) => RefreshIndicator(
                onRefresh: () async => await _loadData(context),
                child: ScreenStateLayout(
                    isLoading: data.productsModel == null,
                    builder: (context) => Padding(
                          padding: EdgeInsets.only(left: 16.r, right: 16.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              isKeyBoredOpen >= 40
                                  ? const SizedBox()
                                  : widget.isFrom=='department'?const SizedBox(): CustomCard(
                                      oneStore: widget.oneStore,
                                    ),
                              SizedBox(height: 12.h),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: CustomTextFieldNormal(
                                    hint: LocaleKeys.findaProduct.tr(),
                                    iconSVG: Assets.searchIcon,
                                    background: AppColors.grayLight,
                                    controller: data.searchController,
                                    onChange: (text) {
                                      _loadData(context);
                                    }),
                              ),
                              if(widget.isFrom =='department')const ListOfCat(),
                              SizedBox(height: 1.h),
                              Flexible(
                                flex: 4,
                                child: ListView(
                                  children:  [
                                    GridViewProducts(model: data.productsModel,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )))));
  }
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key, this.storeId,
  });
final String ? storeId;
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  _loadData(context)async{
   await Provider.of<ProductsViewModel>(context,listen: false).getCars(context);
   await Provider.of<ProductsViewModel>(context,listen: false).getBrands(context);
   await Provider.of<HomeViewModel>(context,listen: false).getDepartments(context);
  }
  @override
  void initState() {
    super.initState();
    _loadData(context);
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width, // Set drawer width to 80% of the screen width
      child: Drawer(
        child:Consumer<ProductsViewModel>(
            builder: (context, data, child) => RefreshIndicator(
                onRefresh: () async => await _loadData(context),
                child: ScreenStateLayout(
                  isLoading:
                  data.carsModel == null||data.brandsModel==null ,
                  builder: (context) => Padding(
          padding: EdgeInsets.only(top: 32.h),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  LocaleKeys.filtering.tr(),
                  style: TextStyles().getTitleStyle(),
                ),
                trailing: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SVGIcon(Assets.closePup, width: 20.w, height: 20.h)),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.black,
                ),
                title: Text(
                  LocaleKeys.section.tr(),
                  style: TextStyles().getTitleStyle(),
                ),
                subtitle: Text(
                 data.departments?.title?? LocaleKeys.filtering.tr(),
                  style: TextStyles().getRegularStyle(),
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0.r),
                        ),
                      ),
                      builder: (context) {
                        return DepartmentSheet();
                      });
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.black,
                ),
                title: Text(
                  LocaleKeys.brand.tr(),
                  style: TextStyles().getTitleStyle(),
                ),
                subtitle: Text(
                  data.brandModel?.title??LocaleKeys.filtering.tr(),
                  style: TextStyles().getRegularStyle(),
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0.r),
                        ),
                      ),
                      builder: (context) {
                        return BrandSheet();
                      });
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.black,
                ),
                title: Text(
                  LocaleKeys.model.tr(),
                  style: TextStyles().getTitleStyle(),
                ),
                subtitle: Text(
                  data.carModel?.title?? LocaleKeys.filtering.tr(),
                  style: TextStyles().getRegularStyle(),
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0.r),
                        ),
                      ),
                      builder: (context) {
                        return const CarSheet() ;
                      });
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.black,
                ),
                title: Text(
                  LocaleKeys.manufacturingYear.tr(),
                  style: TextStyles().getTitleStyle(),
                ),
                subtitle: Text(
                  '${data.year ??LocaleKeys.filtering.tr() }' ,
                  style: TextStyles().getRegularStyle(),
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0.r),
                        ),
                      ),
                      builder: (context) {
                        return ManufactureYearSheet();
                      });
                },
              ),
              SizedBox(height: 290.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 145.w,
                    child: CustomButton(
                      color: AppColors.white,
                      onTap: () {
                        data.carModel=null;
                        data.brandModel=null;
                        data.year=null;
                        data.departments=null;
                       data.searchController.text='';
                       data.departments?.id=null;
                        data.getProducts(context, '', '', widget.storeId);
                        data.notify();
                        data.notify();
                        Navigator.pop(context);
                      },
                      title: tr(LocaleKeys.reset),
                      textColor: AppColors.black,
                      isRounded: false,
                      borderColor: AppColors.black,
                    ),
                  ),
                  SizedBox(
                    width: 185.w,
                    child: CustomButton(
                      color: AppColors.primaryColor,
                      onTap: () {
                        String title=data.searchController.text;
                        String departmentId=data.departments?.id.toString()??'';
                        data.getProducts(context, title, departmentId, widget.storeId);
                        data.notify();
                        Navigator.pop(context);
                      },
                      title: tr(LocaleKeys.activation),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )))),
    );
  }
}
