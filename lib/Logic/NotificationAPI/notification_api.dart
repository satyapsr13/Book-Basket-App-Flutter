// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future showNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    return _notifications.show(
      id,
      title,
      body,
      await _notificationDetails(),
      payload: payload,
    );
  }

  static Future showScheduleNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduledDate,
  }) async {
    log("-------------showScheduleNotification-------------");

    return _notifications.zonedSchedule(
      id,
      title,
      body,
      // tz.TZDateTime.from(scheduledDate, tz.local),
      tz.TZDateTime.from(scheduledDate, tz.local),

      await _notificationDetails(),
      payload: payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static Future init({bool initScheduled = false}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) async {
      log('onDidReceiveLocalNotification: $id');
    });
    final settings = InitializationSettings(android: android, iOS: iOS);
    tz.initializeTimeZones();
    // log("------NotificationApi.dart---init function --------payload ->   --------------------------");
    await _notifications.initialize(settings,
        onSelectNotification: (payload) async {
      // log("------NotificationApi.dart---init function --------payload ->  $payload --------------------------");
      onNotifications.add(payload);
    });
    // if (initScheduled) {
    //   await _scheduleNotifications();
    // }
  }

  static Future _scheduleNotifications() async {
    // await _notifications.cancelAll();
    await _notifications.periodicallyShow(
        0,
        'Reminder',
        'Please take your blood pressure reading',
        RepeatInterval.hourly,
        await _notificationDetails());
  }

  static Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        "channel id",
        "channel name",
        color: Colors.green,
        channelDescription: "This channel is for important notification",
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }
}
