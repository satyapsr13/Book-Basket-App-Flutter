// // ignore_for_file: void_checks

// import 'dart:core';
// import 'dart:developer';

// // import 'package:awesome_notifications/utils';
// import 'package:awesome_notifications/awesome_notifications.dart';
// // Future<void> createReminderNotification() async {
// //   log("--------${createUniqueId()}---------");
// //   await AwesomeNotifications()
// //       .createNotification(
// //         content: NotificationContent(
// //           id: createUniqueId(),
// //           channelKey: 'basic_channel',
// //           title: '${Emojis.building_hospital} NHS-Monitor',
// //           body: "Please check your BP!",
// //           bigPicture: "asset://assets/images/green_bulb.png",
// //           notificationLayout: NotificationLayout.BigPicture,
// //         ),
// //         actionButtons: [
// //           NotificationActionButton(key: 'Mark_Done', label: 'Done')
// //         ],
// //       )
// //       .then((value) => log("----------------message $value"))
// //       .onError((error, stackTrace) {
// //         log("---------------------message onError $error");
// //         return false;
// //       });
// // }

// // Future<int> createReminderScheduleNotification(
// //     ReminderModel notificationSchedule) async {
// //   //  ) async {
// //   int id = createUniqueId();
// //   log(id.toString());
// //   await AwesomeNotifications()
// //       .createNotification(
// //           content: NotificationContent(
// //             id: id,
// //             channelKey: 'scheduled_channel',
// //             title: '${Emojis.building_hospital} NHS-Monitor',
// //             body: "   Please check your BP!",
// //             bigPicture: "asset://assets/images/back_ground_lady_image.png",
// //             notificationLayout: NotificationLayout.BigPicture,
// //           ),
// //           actionButtons: [
// //             NotificationActionButton(
// //                 key: 'Mark_Done',
// //                 label: 'Check BP',
// //                 buttonType: ActionButtonType.KeepOnTop),
// //           ],
// //           schedule: NotificationCalendar(
// //             // weekday: notificationSchedule.daysList == "All Days"
// //             //     ? null
// //             //     : weekDayToIntConverter[notificationSchedule.daysList],
// //             hour: notificationSchedule.hour,
// //             minute: notificationSchedule.minutes,
// //             second: 0,
// //             millisecond: 0,
// //             repeats: notificationSchedule.isRepeat,
// //             // timeZone: tz.TZDateTime.from(scheduledDate, tz.local), ,
// //             // repeats: false,
// //           ))
// //       .then((value) => log("----------Notification set successflly--------"));
// //   //     .then((value) => log("----------------message $value"))
// //   //     .onError((error, stackTrace) {
// //   //   log("---------------------message onError $error");
// //   //   return false;
// //   // });
// //   return id;
// // }

// Future<void> cancelScheduledNotifications() async {
//   await AwesomeNotifications().cancelAllSchedules();
// }

// Future<void> cancelSpecificNotifications(int id) async {
//   await AwesomeNotifications().cancel(id).then((value) {
//     log("-------Success fully cancelled ID: $id  ==============");
//   });
// }
