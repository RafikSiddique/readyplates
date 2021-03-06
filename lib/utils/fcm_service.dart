import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart';
import 'package:readyplates/utils/api_services.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';

class FirebaseMessagingService extends ApiService {
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
      enableVibration: true,
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
    if (i == 0) {
      print("Init Messaging Called");
      getToken();
      i++;
    }
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
        AndroidNotificationChannel('ReadyPlates', 'Ready Plates',
            playSound: true, importance: Importance.max, enableVibration: true);
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings(
            requestAlertPermission: true, requestSoundPermission: true);
    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    //}
  }

  Future<String?> getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print(token);
    print("Called");
    if (token != null) setToken(token);
    return token;
  }

  Future<void> setToken(String token) async {
    String userId = await SharedPreferenceHelper().getUserId();
    try {
      if (userId != "") {
        FirebaseFirestore.instance.collection('customer').doc(userId).set(
          {
            DateTime.now().toString(): token,
          },
        );
        var res = await post(Uri.parse(baseUri + 'restaurants/token/'),
            headers: contentTypeJsonHeader,
            body: jsonEncode({
              'user': userId,
              'token': token,
            }));
        print(res);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
