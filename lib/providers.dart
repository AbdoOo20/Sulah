import 'package:flutter/cupertino.dart';
import 'package:khedmaty/presentation/modules/layout/children/home/children/products/productsViewModel.dart';
import 'package:khedmaty/presentation/modules/layout/children/home/children/shoppingCard/shopping_cared_view_model.dart';
import 'package:khedmaty/presentation/modules/layout/children/home/homeViewModel.dart';
import 'package:khedmaty/presentation/modules/layout/children/my_orders/my_orders_view_model.dart';
import 'package:khedmaty/presentation/modules/layout/children/offers/offer%20view%20model.dart';
import 'package:khedmaty/presentation/modules/layout/children/setting/settingViewModel.dart';
import 'package:provider/provider.dart';
import 'data/datasource/locale/database_provider.dart';
import 'injection.dart';
import 'presentation/modules/auth/auth_view_model.dart';

class GenerateMultiProvider extends StatelessWidget {
  final Widget child;

  const GenerateMultiProvider({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<AuthViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<HomeViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<ProductsViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<SettingViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<CartProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<ShoppingCaredViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<MyOrdersViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<OfferProvider>()),
      ],
      child: child,
    );
  }
}
