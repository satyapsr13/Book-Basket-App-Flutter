// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'dart:io';

// import 'package:auto_route/auto_route.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:nhsbpmonitor/Constants/enums.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// import 'package:nhsbpmonitor/Constants/locations.dart';
// import 'package:nhsbpmonitor/Logic/Cubit/reminder_cubit/reminder_cubit.dart';
// import 'package:nhsbpmonitor/Logic/NotificationAPI/notifications.dart';
// import 'package:nhsbpmonitor/Presentation/Screens/Reminders/reminder_list_card.dart';
// import 'package:nhsbpmonitor/Presentation/Widgets/drawer.dart';
// import 'package:nhsbpmonitor/Presentation/Widgets/snackbar.dart';
// import 'package:nhsbpmonitor/Routes/routes.gr.dart';
// // import 'package:nhsbpmonitor/Presentation/Widgets/gradient_screen_widget.dart';

// class RemindersScreen extends StatefulWidget {
//   const RemindersScreen({Key? key}) : super(key: key);

//   @override
//   State<RemindersScreen> createState() => _RemindersScreenState();
// }

// class _RemindersScreenState extends State<RemindersScreen> {
//   void awesomeNotificationsetting() {
//     AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
//       if (!isAllowed) {
//         showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//                   // title: Text(tr('notification_permission_title')),
//                   content: Text("Allow Notification"),
//                   actions: <Widget>[
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: Text(
//                         "Don't Allow!",
//                         style: TextStyle(color: Colors.grey, fontSize: 18),
//                       ),
//                     ),
//                     TextButton(
//                       child: Text("Allow Notification"),
//                       onPressed: () {
//                         AwesomeNotifications()
//                             .requestPermissionToSendNotifications()
//                             .then((value) => Navigator.pop(context));
//                       },
//                     ),
//                   ],
//                 ));
//       }
//     });
//   }

//   @override
//   void initState() {
//     awesomeNotificationsetting();
//     BlocProvider.of<ReminderCubit>(context).fetchReminderFromLocalDataBase();

//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     final mediaquery = MediaQuery.of(context).size;
//     // List<ReminderListCard> reminderList = [];

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color(0xffF0F4F6),
//         key: _scaffoldKey,
//         endDrawer: MyDrawer(),
//         bottomNavigationBar: InkWell(
//           onTap: () {
//             context.pushRoute(AddRemindersScreen());
//           },
//           // onTap: createReminderNotification,
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Container(
//               height: 50,
//               color: Color(0xffFF9333),
//               width: mediaquery.width * 0.85,
//               child: Row(
//                 children: [
//                   const Spacer(),
//                   const Icon(
//                     Icons.add,
//                     color: Colors.white,
//                   ),
//                   Text(
//                     tr('add_reminders'),
//                     style: const TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   const Spacer(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: BlocBuilder<ReminderCubit, ReminderState>(
//             builder: (context, state) {
//               if (state.status == Status.loading) {
//                 return SizedBox(
//                     height: mediaquery.height * 0.5,
//                     width: mediaquery.width,
//                     child: const Center(
//                         child: CircularProgressIndicator(
//                       color: Color(0xff23A6B1),
//                     )));
//               }

//               return Column(
//                 children: [
//                   Container(
//                     width: mediaquery.width,
//                     height: 70,
//                     color: Colors.white,
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Image.asset(
//                             AssetImages.logo,
//                           ),
//                         ),
//                         const Spacer(),
//                         InkWell(
//                           onTap: () {},
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: SvgPicture.asset(
//                               AssetIcons.bell,
//                               height: 21,
//                               width: 20,
//                               color: Color(0xffFF9333),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             // Scaffold.of(context).openEndDrawer();
//                             _scaffoldKey.currentState!.openEndDrawer();
//                             // Scaffold.of(context).openDrawer();
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: SvgPicture.asset(
//                               AssetIcons.menu,
//                               height: 21,
//                               width: 20,
//                               color: Color(0xff23A6B1),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Stack(
//                     children: [
//                       Image.asset(AssetImages.doctorWithStethoscope,
//                           fit: BoxFit.cover),
//                       Container(
//                         width: mediaquery.width,
//                         height: 70,
//                         color: Color(0xff23A6B1).withOpacity(0.5),
//                         child: Row(
//                           children: [
//                             _backButton(context),
//                             Text(
//                               tr('reminders'),
//                               style: const TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   state.reminderList.isEmpty
//                       ? noReminderIcon(mediaquery)
//                       : ListView.builder(
//                           physics: NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           reverse: true,
//                           itemCount: state.reminderList.length,
//                           itemBuilder: (ctx, index) => Center(
//                             child: ReminderListCard(
//                               mediaquery: mediaquery,
//                               reminderModel: state.reminderList[index],
//                             ),
//                           ),
//                         ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   SizedBox noReminderIcon(Size mediaquery) {
//     return SizedBox(
//       height: mediaquery.height * 0.7,
//       width: mediaquery.width * 0.7,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Image.asset(
//               AssetImages.reminder,
//               fit: BoxFit.contain,
//             ),
//           ),
//           Text(
//             'You have no Reminders',
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }

//   IconButton _backButton(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           Navigator.pop(context);
//         },
//         icon: const Icon(
//           Icons.arrow_back,
//           size: 25,
//           color: Colors.white,
//         ));
//   }

//   Text title(String data) {
//     return Text(
//       tr(data),
//       style: TextStyle(
//         fontSize: 15,
//         fontWeight: FontWeight.bold,
//         color: Color(0xff0F2851),
//       ),
//     );
//   }

//   Text info(String data) {
//     return Text(
//       tr(data),
//       style: TextStyle(
//         fontSize: 15,
//         fontWeight: FontWeight.bold,
//         color: Color(0xff8D9BB4),
//       ),
//     );
//   }
// }
