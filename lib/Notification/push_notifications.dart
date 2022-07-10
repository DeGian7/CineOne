import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotification {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStream =
      StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    // ignore: avoid_print
    print('onBackground Handler ${message.messageId}');
    // ignore: avoid_print
    print(message.data);
    _messageStream.add(message.data['message'] ?? 'No data');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    // print( 'onMessage Handler ${ message.messageId }');
    // ignore: avoid_print
    print(message.data);
    _messageStream.add(message.data['message'] ?? 'No data');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    // print( 'onMessageOpenApp Handler ${ message.messageId }');
    // ignore: avoid_print
    print(message.data);
    _messageStream.add(message.data['message'] ?? 'No data');
  }

  static Future initializeApp() async {
    // Push Notifications
    await Firebase.initializeApp();
    await requestPermission();

    token = await FirebaseMessaging.instance.getToken();
    // ignore: avoid_print
    print('Token: $token');

    // Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    // Local Notifications
  }

  // Apple / Web
  static requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);

    // ignore: avoid_print
    print('User push notification status ${settings.authorizationStatus}');
  }

  static closeStreams() {
    _messageStream.close();
  }
}