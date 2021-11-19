import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseMessagingService {
  int i = 0;
  FirebaseMessagingService() {
    //if (i == 0) {
    i++;
    print(i);
    print("Constructor called");
    initializeMessaging();
    initLocalNotification();
    /* } else {
      print("Not Calling");
    } */
  }

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> showMessage(RemoteMessage message) async {
    print(message.data);
    print(message.notification?.body);
    print(message.notification?.title);

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'ReadyPlates',
      'Ready Plates',
      priority: Priority.max,
      importance: Importance.max,
      playSound: true,
    );
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
    );
    return Future<void>.value();
  }

  void initializeMessaging() {
    // if (i < 2) {
    print("Init Messaging Called");
    getToken();
    FirebaseMessaging.onMessage.listen((event) {
      print("OnMessage");
      showMessage(event);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print("On Message Opened app");
      showMessage(event);
    });
    FirebaseMessaging.instance.getInitialMessage().then((v) {
      if (v != null) {
        print(v.data);
        print(v.notification?.body);
        print(v.notification?.title);
      }
    });

    FirebaseMessaging.onBackgroundMessage(showMessage);
    //}
  }

  void initLocalNotification() {
    // if (i < 2) {
    print("Init local notification called");
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(
      'ReadyPlates',
      'Ready Plates',
      playSound: true,
      importance: Importance.max,
    );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    //}
  }

  Future<String?> getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print(token);
    print("Called");
    return token;
  }

  Future<void> setToken() async {
    //TODO Set Token
  }
}
