// // ignore_for_file: must_be_immutable

// import 'dart:async';

// import 'package:auto_route/auto_route.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:nhsbpmonitor/Constants/locations.dart';
// import 'package:nhsbpmonitor/Data/model/api/Reminder/reminder_model.dart';
// import 'package:nhsbpmonitor/Logic/Cubit/reminder_cubit/reminder_cubit.dart';
// import 'package:nhsbpmonitor/Logic/Cubit/user_profile_cubit/user_profile_cubit.dart';
// import 'package:nhsbpmonitor/Routes/routes.gr.dart';

// // import 'package:nhsbpmonitor/constants/locations.dart';

// class ReminderListCard extends StatelessWidget {
//   ReminderModel reminderModel;

//   Size mediaquery;
//   ReminderListCard({
//     Key? key,
//     required this.reminderModel,
//     required this.mediaquery,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: Container(
//         width: mediaquery.width * 0.85,
//         // height: mediaquery.height * 0.3,
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                 color: const Color(0xff1A458F).withOpacity(0.15),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: const Offset(0, 3), // changes position of shadow
//               ),
//             ]),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: mediaquery.width * 0.85,
//               height: 60,
//               decoration: const BoxDecoration(
//                 color: Color(0xff333333),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10),
//                   topRight: Radius.circular(10),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Row(
//                   children: [
//                     SvgPicture.asset(
//                       AssetIcons.alert,
//                       height: 21,
//                       width: 20,
//                       color: const Color(0xff23A6B1),
//                     ),
//                     const Spacer(
//                       flex: 2,
//                     ),
//                     Text(
//                       tr("bp_check_reminder"),
//                       style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     const Spacer(
//                       flex: 5,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 15),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Row(
//                 children: [
//                   SvgPicture.asset(
//                     AssetIcons.calender,
//                     height: 21,
//                     width: 20,
//                     color: const Color(0xffFF9333),
//                   ),
//                   Text(
//                     "  ${reminderModel.daysList}",
//                     style: const TextStyle(),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 15),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Row(
//                 children: [
//                   const Icon(
//                     Icons.access_time_sharp,
//                     color: Color(0xffFF9333),
//                     size: 20,
//                   ),
//                   Text(
//                     "  ${reminderModel.hour}.${reminderModel.minutes} ${reminderModel.amORpm}",
//                     style: const TextStyle(),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       BlocProvider.of<ReminderCubit>(context)
//                           .deleteReminder(reminderModel.id);
//                     },
//                     child: _deleteButton(),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       context.pushRoute(
//                           // AddRemindersScreen(hour: reminderModel.hour,minute: reminderModel.minutes,amORpm: reminderModel.amORpm,daysList: reminderModel.daysList,id: reminderModel.id));
//                           AddRemindersScreen(
//                               hour: reminderModel.hour,
//                               minute: reminderModel.minutes));
//                       // BlocProvider.of<ReminderCubit>(context)
//                       //     .deleteReminder(reminderModel.id);
//                     },
//                     child: Container(
//                       height: 50,
//                       width: mediaquery.width * 0.3,
//                       decoration: BoxDecoration(
//                         color: const Color(0xff23A6B1),
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: Center(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Icon(
//                               Icons.edit,
//                               color: Colors.white,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 tr("edit"),
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Container _deleteButton() {
//     return Container(
//       height: 50,
//       width: mediaquery.width * 0.3,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           border: Border.all(color: Colors.red, width: 2)),
//       child: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(
//               Icons.delete_outlined,
//               color: Colors.red,
//             ),
//             Text(
//               tr("delete"),
//               style: const TextStyle(
//                 color: Colors.red,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
