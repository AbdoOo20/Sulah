// import 'dart:io';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:provider/provider.dart';
//
// import '../../core/routing/route.dart';
// import '../../data/model/response/chatModel.dart';
// import '../modules/home/homeViewModel.dart';
// import '../modules/my_orders/chat/chatScreen.dart';
// import '../modules/my_orders/chat/chat_view_model.dart';
// import '../modules/my_orders/my_orders_view_model.dart';
// import '../modules/my_orders/orderDetails/my_order_details.dart';
//
//
//
// class NotificationServices {
//
//   //initialising firebase message plugin
//   FirebaseMessaging messaging = FirebaseMessaging.instance ;
//
//   //initialising firebase message plugin
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin  = FlutterLocalNotificationsPlugin();
//
//
//
//   //function to initialise flutter local notification plugin to show notifications for android when app is active
//   void initLocalNotifications(BuildContext context, RemoteMessage message)async{
//     var androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
//     var iosInitializationSettings = const DarwinInitializationSettings();
//
//     var initializationSetting = InitializationSettings(
//         android: androidInitializationSettings ,
//         iOS: iosInitializationSettings
//     );
//
//     await _flutterLocalNotificationsPlugin.initialize(
//         initializationSetting,
//       onDidReceiveNotificationResponse: (payload){
//           // handle interaction when app is active for android
//           handleMessage(context, message);
//       }
//     );
//   }
//
//   void firebaseInit(BuildContext context){
//     FirebaseMessaging.onMessage.listen((message) {
//
//       RemoteNotification? notification = message.notification ;
//       AndroidNotification? android = message.notification!.android ;
//       setFCMDataInApp(message,context);
//
//       if(Platform.isIOS){
//         forgroundMessage();
//       }
//
//       if(Platform.isAndroid){
//         initLocalNotifications(context, message);
//         showNotification(message);
//       }
//
//       if (kDebugMode) {
//         print("notifications title:${notification!.title}");
//         print("notifications body:${notification.body}");
//         print('count:${android!.count}');
//         print('data:${message.data.toString()}');
//       }
//
//     });
//   }
//   setFCMDataInApp(RemoteMessage message,BuildContext context){/// set data in for ground
//     var notiType = message.data["type"].toString();
//     print('notiType${notiType}');
//
//     Provider.of<HomeViewModel>(context, listen: false).getNotificationCount(context);
//     Provider.of<HomeViewModel>(context, listen: false).getNotification(context);
//     if(notiType == "order"){
//       print('111111111111111');
//       Provider.of<MyOrdersViewModel>(context, listen: false).getOneOrderApi(context,message.data["order_id"].toString());
//       Provider.of<MyOrdersViewModel>(context, listen: false).getMyOrdersApi(context,"new");
//     }
//     else if(notiType == "chat"){
//       print('derfderfdfffff${ message.data["file"].toString()}');
//       ChatMessage chatMessageData = ChatMessage();
//       chatMessageData.senderType = message.data["sender_type"].toString();
//       chatMessageData.type = message.data["chat_message_type"].toString();
//       chatMessageData.message = message.data["message"].toString();
//       chatMessageData.file = message.data["file"].toString();
//       chatMessageData.createdAt = message.data["created_at"].toString();
//
//       if(Provider.of<ChatViewModel>(context, listen: false).roomId ==  message.data["room_id"].toString()){
//         Provider.of<ChatViewModel>(context, listen: false).chatMessageData.add(chatMessageData);
//         Provider.of<ChatViewModel>(context, listen: false).refreshData();
//       }
//
//     }
//   }
//
//   void requestNotificationPermission() async {
//     NotificationSettings settings = await messaging.requestPermission(
//         alert: true,
//         announcement: true,
//         badge: true,
//         carPlay: true,
//         criticalAlert: true,
//         provisional: true,
//         sound: true ,
//     );
//
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       if (kDebugMode) {
//         print('user granted permission');
//       }
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       if (kDebugMode) {
//         print('user granted provisional permission');
//       }
//     } else {
//       //appsetting.AppSettings.openNotificationSettings();
//       if (kDebugMode) {
//         print('user denied permission');
//       }
//     }
//   }
//   Future<Map<Permission, PermissionStatus>> requestPermission() async { /// this other Permission for ios
//     Map<Permission, PermissionStatus> statuses = await [
//       Permission.notification
//     ].request();
//     return statuses;
//   }
//   // function to show visible notification when app is active
//   Future<void> showNotification(RemoteMessage message)async{
//
//     AndroidNotificationChannel channel = AndroidNotificationChannel(
//         message.notification!.android!.channelId.toString(),
//       message.notification!.android!.channelId.toString() ,
//       importance: Importance.max  ,
//       showBadge: true ,
//       playSound: true,
//       // sound: const RawResourceAndroidNotificationSound('jetsons_doorbell')
//       sound: null
//     );
//
//      AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
//       channel.id.toString(),
//       channel.name.toString() ,
//       channelDescription: 'your channel description',
//       importance: Importance.high,
//       priority: Priority.high ,
//       playSound: true,
//       ticker: 'ticker' ,
//          sound: channel.sound
//     //     sound: RawResourceAndroidNotificationSound('jetsons_doorbell')
//     //  icon: largeIconPath
//     );
//
//     const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
//       presentAlert: true ,
//       presentBadge: true ,
//       presentSound: true
//     ) ;
//
//     NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: darwinNotificationDetails
//     );
//
//     Future.delayed(Duration.zero , (){
//       _flutterLocalNotificationsPlugin.show(
//           0,
//           message.notification!.title.toString(),
//           message.notification!.body.toString(),
//           notificationDetails ,
//       );
//     });
//
//   }
//
//   //function to get device token on which we will send the notifications
//   Future<String> getDeviceToken() async {
//     String? token = await messaging.getToken();
//     return token!;
//   }
//
//   // void isTokenRefresh()async{
//   //   messaging.onTokenRefresh.listen((event) {
//   //     event.toString();
//   //     if (kDebugMode) {
//   //       print('refresh');
//   //     }
//   //   });
//   // }
//
//   //handle tap on notification when app is in background or terminated
//   Future<void> setupInteractMessage(BuildContext context)async{
//
//     // when app is terminated
//     RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
//
//     if(initialMessage != null){
//       handleMessage(context, initialMessage);
//     }
//
//
//     //when app ins background
//     FirebaseMessaging.onMessageOpenedApp.listen((event) {
//       handleMessage(context, event);
//     });
//
//   }
//
//   ///handel adar if terminated or background
//   void handleMessage(BuildContext context, RemoteMessage message) {
//
//     print("message.data--------oo0--------${message.data.toString()}");
//
//     var notiType = message.data["type"].toString();
//     if(notiType == "delivery_order"){ /// this in other app of delivery  point
//       print('111111111111111');
//     }else if(notiType == "order") {
//       print('444444444');
//       push(OrderDetails(orderId: message.data["order_id"] ?? "",));
//     }
//     else if(notiType == "chat"){
//       print('55555555555');
//       push(ChatScreen(storeId: message.data["store_id"] ?? "",userId: message.data["user_id"] ?? "",
//           driverId: message.data["driver_id"] ?? "",orderId: message.data["order_id"] ?? ""));
//     }
//
//   }
//
//
//   Future forgroundMessage() async {
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
//
//
// }