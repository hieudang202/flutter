
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class FCMNotification{
  FCMNotification._privateConstructor();
  static final FCMNotification instance = FCMNotification._privateConstructor();
  final FirebaseMessaging _fcm = FirebaseMessaging();

  // void saveDeviceToken() async{
  //   if (Platform.isIOS) checkForIosPermission();

    // _fcm.subscribeToTopic('/topics/GoldCoast');
    // _fcm.getToken().then((token) {
      // MySharedPreferences.instance.setStringValue(Constants.KEY_FCMTOKEN, token);
      // print('FCM Token: '+ token);
    // });
    // _fcm.
    // _fcm.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     print('on message $message');
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     print('on resume $message');
    //   },
    //   onLaunch: (Map<String, dynamic> message) async {
    //     print('on launch $message');
    //   },
    // );
  // }

  // void checkForIosPermission() {
  //   _fcm.requestNotificationPermissions(
  //       IosNotificationSettings(sound: true, badge: true, alert: true));
  //   _fcm.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
  //     print("Settings registered: $settings");
  //   });
  // }
}