import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tbd_flutter/main.dart';


class NotificationHelper{

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final notifications = FlutterLocalNotificationsPlugin();
  final DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
    defaultPresentAlert: true,
    defaultPresentBadge: true,
    defaultPresentSound: true,
  );
  final AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  firebaseNotificationInit() async {

    // todo: ask permission to user for notification
    notificationPermission();

    // todo: initialize of app icon set for android and few settings of notification(Android/IOS both)
    var initializationSettings = InitializationSettings(iOS: initializationSettingsIOS, android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) async {
        // todo: receive payload data of foreground notification || click event of notification when application is on foreground
      },
    );

    // todo: click event of notification when application is on background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if(message.notification?.title != null){}
    });

    // todo: click event of notification when application is on kill(terminated)
    firebaseMessaging.getInitialMessage().then((value) {

    });

    FirebaseMessaging.onMessage.listen(showFlutterNotification);
  }

  Future<void> showFlutterNotification(RemoteMessage message) async {

    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null && Platform.isAndroid) {
      String notificationId = "";
      String notificationStatus = "";
      if(message.data["noti_id"] != null){
        notificationId = message.data["noti_id"];
      }
      if(message.data["status"] != null){
        notificationStatus = message.data["status"];
      }
      notificationStatus == "pending"? flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        payload: notificationId,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: '@mipmap/ic_launcher',
          ),
        ),
      ) : flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        payload: notificationId, /// send data by foreground notification
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: '@mipmap/ic_launcher',
          ),
        ),
      );
    }

    // Constants.isNotificationBadge.value = true;
    // if(message.data["badge"] != null){
    //   FlutterAppBadger.updateBadgeCount(int.parse(message.data["badge"]));
    //   await SharedPreference().setNotificationBadge(true);
    // }
  }

  void notificationPermission() async {
    NotificationSettings settings  = await firebaseMessaging.requestPermission(
      sound: true,
      badge: true,
      alert: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User grander provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }
}



