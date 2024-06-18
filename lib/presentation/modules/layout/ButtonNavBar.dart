import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/core/res/text_styles.dart';
import 'package:khedmaty/core/resources/app_assets.dart';
import 'package:khedmaty/core/resources/app_colors.dart';
import 'package:khedmaty/core/resources/locale_keys.g.dart';
import 'package:khedmaty/injection.dart';
import 'package:khedmaty/presentation/component/component.dart';
import 'package:khedmaty/presentation/modules/layout/children/offers/offer%20screen.dart';
import '../../component/svg_icon.dart';
import '../layout/children/category/category.dart';
import '../layout/children/home/home.dart';
import '../layout/children/my_orders/my_orders.dart';
import '../layout/children/setting/setting.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar(this.selectIndex, {super.key});

  final int? selectIndex;

  @override
  State<CustomBottomNavigationBar> createState() => _BottomNavigationBar();
}

class _BottomNavigationBar extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Home(saveUserData: getIt()),
    const Category(
      whichType: '',
    ),
    const MyOrders(),
    const MyOffers(),
    const MyAccount(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.selectIndex != null) {
      _selectedIndex = widget.selectIndex!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 10,
        selectedLabelStyle: TextStyles().getRegularStyle(fontSize: 12.sp),
        unselectedLabelStyle: TextStyles().getRegularStyle(fontSize: 12.sp),
        fixedColor: AppColors.primaryColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const SVGIcon(
              Assets.homeIcon,
              color: Colors.grey,
            ),
            activeIcon: const SVGIcon(
              Assets.homeIcon,
              color: AppColors.primaryColor,
            ),
            label: tr("khedmaty"),
          ),
          BottomNavigationBarItem(
            icon: const SVGIcon(
              Assets.category,
              color: Colors.grey,
            ),
            activeIcon: const SVGIcon(
              Assets.category,
              color: AppColors.primaryColor,
            ),
            label: tr(LocaleKeys.departments),
          ),
          BottomNavigationBarItem(
            icon: const SVGIcon(
              Assets.myOrders,
              color: Colors.grey,
            ),
            activeIcon: const SVGIcon(
              Assets.myOrders,
              color: AppColors.primaryColor,
            ),
            label: tr('orders'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.shopping_basket_outlined,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.shopping_basket_outlined,
              color: AppColors.primaryColor,
            ),
            label: tr('offers'),
          ),
          BottomNavigationBarItem(
            icon: const SVGIcon(
              Assets.settingsIcon,
              color: Colors.grey,
            ),
            activeIcon: const SVGIcon(
              Assets.settingsIcon,
              color: AppColors.primaryColor,
            ),
            label: tr('myAccount'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
