class AppURL {
  static const String kBaseURL = "https://sulah.sa/api/";
  ///Auth
 static const String kLoginURI = "auth/login/client";
  static const String kRegisterURI = "auth/register-client";
  static const String sendCodeURI = "auth/send-code";
 static const String verificationCodeURI = "auth/confirm-code";
 static const String kUpdateProfileURI = "auth/update/profile";
 static const String kLogoutURI = "auth/logout";
 static const String kDeleteAccountURI = "auth/delete/profile";
  static const String kUpdateFCMTokenURI = "user/profile/updateToken";
  ///home
  static const String kHomeSliderURI = "clients/sliders";
  static const String kDepartmentsURI = "clients/departments";
  static const String kGetNotificationsURI = "user/profile/notifications";
  static const String kNearStores = "clients/nearest-stores?latitude=";
  static const String kBestStores = "clients/stores";
  static const String kBestSeller = "clients/best-seller";
  ///Contact Us
  static const String kContactUsURL = "clients/contact-us";
  ///products ..
  static const String kOneProductURI = "clients/products/";
  static const String kProductsURI = "clients/products";
  static const String kCarsURL = "clients/cars";
  static const String kBrandsURL = "clients/brands";
  static const String kSimilarProductsURL = "clients/similar-products";
  ///store saves & favourites
  static const String kSavesURL = "clients/saves";
  static const String kMyFavoriteURI = "clients/favourites";
///rate
  static const String kStoreRatesURL = "clients/store-rates?store_id=";
  static const String kRatesStoreURL = "clients/rates-stores";
  ///orders
  static const String kMyOrder = "clients/orders"; //اللينك ده عليه شغل ٣ لينكات
  ///setting
  static const String kSettingURI = "setting";
  ///home

}
