
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../presentation/modules/layout/children/home/children/products/widget/alertCardPop.dart';
import '../../../presentation/modules/layout/children/home/children/products/widget/add_from_anthere_store_dialog.dart';
import 'database_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartItems> cartItems = [];

  getCart() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? data = pref.getString("cart");
    if (data != null) {
      cartItems = cartItemsFromJson(data);
    } else {
      cartItems=[];
    }
    totalPrice();
    updateCountProductInTheCart();
    notifyListeners();
  }

  addToCart(CartItems cartItem, BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (cartItems.isEmpty) {
      cartItems.add(cartItem);
      updateCountProductInTheCart();
      pref.setString("cart", cartItemsToJson(cartItems));
      if (!context.mounted) return;
      addToCartPop(context);
    } else {
      if (cartItems.any((element) => element.id == cartItem.id)) {
        for (var i = 0; i < cartItems.length; i++) {
          if(cartItems[i].id == cartItem.id ){
            deleteItem(cartItems[i]);
            cartItems.add(cartItem);
            updateCountProductInTheCart();
            pref.setString("cart", cartItemsToJson(cartItems));
            if (!context.mounted) return;
            addToCartPop(context);
            notifyListeners();
          }
        }
        } else {
        cartItems.add(cartItem);
        pref.setString("cart", cartItemsToJson(cartItems));
        if (!context.mounted) return;
        addToCartPop(context);
        notifyListeners();
      }
      totalPrice();
     updateCountProductInTheCart();
     notifyListeners();
    }
  }

  deleteItem(CartItems cartItem) async {
    cartItems.remove(cartItem);
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("cart", cartItemsToJson(cartItems));
    totalPrice();
    updateCountProductInTheCart();
    notifyListeners();
  }


  updateItem() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("cart", cartItemsToJson(cartItems));
    totalPrice();
    updateCountProductInTheCart();
    notifyListeners();
  }
  num total = 0;
  totalPrice() {
    num price = 0;
    num extrasPrice = 0;
    for (var element in cartItems) {
      price += element.price * element.quantity;
    }
    total = price + extrasPrice;
    notifyListeners();
  }
  /// collect price
  num totalOneProduct = 0;
  collectTotalPrice(CartItems cartItems){
    num price = 0;
    num extrasPrice = 0;
    price = (cartItems.price * cartItems.quantity)+(extrasPrice);
    totalOneProduct = price;
    notifyListeners();
  }
  // collect count Product in cart
  int countProductInCart = 0;
  int get value => countProductInCart;
  void updateCountProductInTheCart() async {
    countProductInCart = 0;
    for (var element in cartItems) {
      countProductInCart += element.quantity;
      notifyListeners();
    }
    notifyListeners();
  }
  void addToCartPop(BuildContext context)async{
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return const CardPop();
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
            position: Tween(
                begin: const Offset(0, -1), end: const Offset(0, -0.33))
                .animate(anim1),
            child: child);
      },
    );
  }
  static alertDialogAddFromAnotherStore(context,CartItems cartItems) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return  AddFromAnotherStoreDialog(cartItems:cartItems);
        });
  }
}
