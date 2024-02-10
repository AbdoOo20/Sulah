import UIKit
import Flutter
import GoogleMaps
//import Firebase
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
//      FirebaseApp.configure()
      GMSServices.provideAPIKey("AIzaSyA_9WM91qFprwhIqhU3WxKrGzJ7yi0BYRY")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
