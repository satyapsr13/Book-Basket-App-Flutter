// ignore_for_file: unnecessary_const

import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:nhsbpmonitor/Constants/enums.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nhsbpmonitor/Constants/locations.dart';
import 'package:nhsbpmonitor/Data/model/api/Reminder/reminder_model.dart';
import 'package:nhsbpmonitor/Logic/Cubit/reminder_cubit/reminder_cubit.dart';
import 'package:nhsbpmonitor/Logic/NotificationAPI/awesome_local_notification.dart';
import 'package:nhsbpmonitor/Logic/NotificationAPI/notification_api.dart';
// import 'package:nhsbpmonitor/Presentation/Screens/signals_screen.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/drawer.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/primary_button.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/snackbar.dart';
import 'package:nhsbpmonitor/Routes/routes.gr.dart';
// import 'package:nhsbpmonitor/Presentation/Widgets/gradient_screen_widget.dart';

class AddRemindersScreen extends StatefulWidget {
  // const AddRemindersScreen({Key? key}) : super(key: key);
  int hour;
  int minute;
  AddRemindersScreen({
    Key? key,
    this.hour = 10,
    this.minute = 10,
  }) : super(key: key);
  @override
  State<AddRemindersScreen> createState() => _AddRemindersScreenState();
}

class _AddRemindersScreenState extends State<AddRemindersScreen> {
  @override
  void initState() {
    super.initState();
    NotificationApi.init();
    listenNotification();
  }

  void listenNotification() {
    NotificationApi.onNotifications.stream.listen(onClickNotification);
  }

  void onClickNotification(String? payload) {
    context.pushRoute(const HomeScreen());
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime startDate = DateTime.now();
  // bool isRepeat = true;
  DateTime endDate = DateTime.now();
  // String day = "All Days";
  // int time = 10;
  // int minute = 10;
  int addTiming = 1;
  // String amORpm = "AM";
  List<ReminderModel> reminderList = [
    ReminderModel(
        id: 1,
        daysList: "All Days",
        hour: 10,
        minutes: 10,
        amORpm: "AM",
        isRepeat: true),
  ];
  bool isLoading = false;
  List<int> timeList = <int>[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
  ];
  List<int> minutesList = <int>[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
  ];

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    return BlocListener<ReminderCubit, ReminderState>(
      listener: (context, state) {
        if (state.status == Status.success) {
          showSnackBar(context, Colors.green, "Reminder Set successfully!");
          // context.replaceRoute(const RemindersScreen());
          context.popRoute();
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffEFF4FD),
          key: _scaffoldKey,
          endDrawer: const MyDrawer(),
          persistentFooterButtons: [
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 18.0, right: 18, bottom: 18),
                child: BlocBuilder<ReminderCubit, ReminderState>(
                  builder: (context, state) {
                    return SecondryButton(
                      onPressed: () {
                        // setState(() {
                        //   isLoading = true;
                        // });
                        ReminderModel newReminder = reminderList[0];
                        // newReminder.hour = newReminder.hour +
                        //     (newReminder.amORpm == "PM" ? 12 : 0);
                        if (newReminder.amORpm == "PM") {
                          if (newReminder.hour != 12) {
                            newReminder.hour = newReminder.hour + 12;
                          }
                        } else {
                          if (newReminder.hour == 12) {
                            newReminder.hour = 0;
                          }
                        }
                        // NotificationApi.showScheduleNotification(
                        //     title: "BP check remider",
                        //     body: "Please check your Blood Pressure",
                        //     payload: "it is payload of notification",
                        //     scheduledDate: DateTime(
                        //       DateTime.now().year,
                        //       DateTime.now().month,
                        //       DateTime.now().day,
                        //       element.hour,
                        //       element.minutes,
                        //     ));

                        // Timer(const Duration(seconds: 2), () {
                        // setState(() {
                        //   isLoading = false;
                        // });
                        BlocProvider.of<ReminderCubit>(context)
                            .saveReminderToLocalDataBase(newReminder);
                        // });
                      },
                      buttonText: tr("save"),
                      isLoading: (state.status == Status.loading) || isLoading,
                    );
                  },
                ),
              ),
            ),
          ],
          body: SingleChildScrollView(
            child: Builder(builder: (context) {
              return Column(
                children: [
                  Container(
                    width: mediaquery.width,
                    height: 70,
                    color: Colors.white,
                    child: Row(
                      children: [
                        _logoImage(),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: _bellIcon(),
                        ),
                        InkWell(
                          onTap: () {
                            _scaffoldKey.currentState!.openEndDrawer();
                          },
                          child: _menuIcon(),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Image.asset(AssetImages.doctorWithStethoscope,
                          fit: BoxFit.cover),
                      Container(
                        width: mediaquery.width,
                        height: 70,
                        color: const Color(0xff23A6B1).withOpacity(0.5),
                        child: Row(
                          children: [
                            _backButton(context),
                            Text(
                              tr('reminders'),
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: mediaquery.height * 0.03),
                  Container(
                    width: mediaquery.width * 0.85,
                    decoration: _boxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: mediaquery.width * 0.85,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Color(0xff333333),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AssetIcons.alert,
                                  height: 21,
                                  width: 20,
                                  color: const Color(0xff23A6B1),
                                ),
                                const Spacer(
                                  flex: 2,
                                ),
                                Text(
                                  tr("bp_check_reminder"),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(
                                  flex: 5,
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      // amORpm = "AM";
                                      // time = 10;
                                      // minute = 10;
                                      // day = "All Days";
                                      widget.hour = 10;
                                      widget.minute = 10;

                                      reminderList[0].isRepeat = true;
                                      addTiming = 1;
                                      reminderList.clear();
                                      reminderList.add(
                                        ReminderModel(
                                            id: 1,
                                            daysList: "All Days",
                                            hour: 10,
                                            minutes: 10,
                                            amORpm: "AM",
                                            isRepeat: true),
                                      );
                                    });
                                  },
                                  child: Text(
                                    tr("reset"),
                                    style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      letterSpacing: 1.5,
                                      fontSize: 15,
                                      color: Color(0xffFF9333),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: mediaquery.width * 0.85,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Color(0xffEFF4FD),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  width: mediaquery.width * 0.75,
                                  color: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 0),
                                    child: DropdownButton(
                                      focusColor: Colors.white,
                                      isExpanded: true,
                                      underline: const Text(
                                        '',
                                        style: TextStyle(),
                                      ),
                                      // value: _chosenValue,
                                      //elevation: 5,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      // IconEnabledColor: Colors.black,
                                      items: <String>[
                                        'All Days',
                                        'Monday',
                                        'Tuesday',
                                        'Wednesday',
                                        'Thursday',
                                        'Friday',
                                        'Saturday',
                                        'Sunday',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        );
                                      }).toList(),
                                      hint: Text(
                                        reminderList[0].daysList,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          reminderList[0].daysList =
                                              value.toString();
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            tr("timings"),
                            style: const TextStyle(
                              color: Color(0xff0F2851),
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          child: ListView.builder(
                            itemCount: addTiming,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (ctx, index) => Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: mediaquery.width * 0.2,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffEFF4FD),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: DropdownButton<int>(
                                      focusColor: Colors.white,
                                      menuMaxHeight: mediaquery.height * 0.5,
                                      underline: const Text(''),
                                      isExpanded: true,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      items: timeList
                                          .map<DropdownMenuItem<int>>(
                                              (int value) {
                                        return DropdownMenuItem<int>(
                                          value: value,
                                          child: Text(
                                            value.toString(),
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        );
                                      }).toList(),
                                      hint: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          widget.hour.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          reminderList[index].hour =
                                              value ?? reminderList[index].hour;
                                          widget.hour = value ?? widget.hour;
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: mediaquery.width * 0.2,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffEFF4FD),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: DropdownButton<int>(
                                      focusColor: Colors.white,
                                      underline: const Text(''),
                                      menuMaxHeight: mediaquery.height * 0.5,
                                      isExpanded: true,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      items: minutesList
                                          .map<DropdownMenuItem<int>>(
                                              (int value) {
                                        return DropdownMenuItem<int>(
                                          value: value,
                                          child: Text(
                                            value.toString(),
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        );
                                      }).toList(),
                                      hint: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          widget.minute.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          reminderList[index].minutes =
                                              value ?? widget.minute;
                                          widget.minute =
                                              value ?? widget.minute;
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: mediaquery.width * 0.2,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffEFF4FD),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: DropdownButton<String>(
                                      focusColor: Colors.white,
                                      underline: const Text(''),
                                      menuMaxHeight: mediaquery.width * 0.5,
                                      isExpanded: true,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      items: <String>["AM", "PM"]
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value.toString(),
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        );
                                      }).toList(),
                                      hint: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          reminderList[index].amORpm,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          reminderList[index].amORpm =
                                              value.toString();
                                        });
                                      },
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (addTiming != 1) {
                                            addTiming = addTiming - 1;
                                            reminderList.removeLast();
                                          }
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        size: 20,
                                        color: Colors.red,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 10),
                        //   child: Row(
                        //     children: [
                        //       const Icon(
                        //         Icons.add_circle_outline_outlined,
                        //         color: Color(0xff23A6B1),
                        //         size: 20,
                        //       ),
                        //       // TextButton(
                        //       //   onPressed: () {
                        //       //     setState(() {
                        //       //       addTiming = addTiming + 1;
                        //       //       reminderList.add(
                        //       //         ReminderModel(
                        //       //             id: "",
                        //       //             daysList: "All Days",
                        //       //             hour: 10,
                        //       //             minutes: 10,
                        //       //             amORpm: "AM"),
                        //       //       );
                        //       //     });
                        //       //   },
                        //       //   child: Padding(
                        //       //     padding:
                        //       //         const EdgeInsets.symmetric(horizontal: 8),
                        //       //     child: Text(
                        //       //       tr('add_timing'),
                        //       //       style: const TextStyle(
                        //       //           color: Color(0xff23A6B1),
                        //       //           fontSize: 15,
                        //       //           decoration: TextDecoration.underline),
                        //       //     ),
                        //       //   ),
                        //       // ),
                        //       const Spacer(),
                        //     ],
                        //   ),
                        // ),
                        // _divider(),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 10),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Text(
                        //             tr("start_date"),
                        //             style: const TextStyle(
                        //               fontSize: 15,
                        //               color: Color(0xff0F2851),
                        //             ),
                        //           ),
                        //           const SizedBox(height: 10),
                        //           // Container(
                        //           //   height: 50,
                        //           //   // width: mediaquery.width * 0.35,
                        //           //   color: const Color(0xffEFF4FD),
                        //           //   child: Row(
                        //           //     mainAxisAlignment: MainAxisAlignment.start,
                        //           //     children: [
                        //           //       Padding(
                        //           //         padding: const EdgeInsets.all(10.0),
                        //           //         child: Text(
                        //           //           DateFormat('dd/MM/yyyy')
                        //           //               .format(startDate)
                        //           //               .toString(),
                        //           //           style: const TextStyle(),
                        //           //         ),
                        //           //       ),
                        //           //       InkWell(
                        //           //           onTap: () {
                        //           //             datePicker(context).then((value) {
                        //           //               setState(() {
                        //           //                 startDate = value ?? startDate;
                        //           //               });
                        //           //             });
                        //           //           },
                        //           //           child: _calenderIcon()),
                        //           //     ],
                        //           //   ),
                        //           // ),
                        //         ],
                        //       ),
                        //       const Spacer(),
                        //       // Column(
                        //       //   crossAxisAlignment: CrossAxisAlignment.start,
                        //       //   children: [
                        //       //     Text(
                        //       //       tr("end_date"),
                        //       //       style: const TextStyle(
                        //       //         fontSize: 15,
                        //       //         color: Color(0xff0F2851),
                        //       //       ),
                        //       //     ),
                        //       //     const SizedBox(height: 10),
                        //       //     Container(
                        //       //       height: 50,
                        //       //       // width: mediaquery.width * 0.35,
                        //       //       color: const Color(0xffEFF4FD),
                        //       //       child: Row(
                        //       //         mainAxisAlignment: MainAxisAlignment.start,
                        //       //         children: [
                        //       //           Padding(
                        //       //             padding: const EdgeInsets.all(10.0),
                        //       //             child: Text(
                        //       //               DateFormat('dd/MM/yyyy')
                        //       //                   .format(endDate)
                        //       //                   .toString(),
                        //       //               style: const TextStyle(),
                        //       //             ),
                        //       //           ),
                        //       //           InkWell(
                        //       //             onTap: () {
                        //       //               datePicker(context).then((value) {
                        //       //                 setState(() {
                        //       //                   endDate = value ?? endDate;
                        //       //                 });
                        //       //               });
                        //       //             },
                        //       //             child: _calenderIcon(),
                        //       //           ),
                        //       //         ],
                        //       //       ),
                        //       //     ),
                        //       //   ],
                        //       // ),
                        //     ],
                        //   ),
                        // ),

                        _divider(),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(
                                tr('repeat'),
                                style: const TextStyle(),
                              ),
                              const Spacer(),
                              Switch.adaptive(
                                  activeTrackColor: const Color(0xffEFF4FD),
                                  activeColor: const Color(0xff00CC5A),
                                  value: reminderList[0].isRepeat,
                                  onChanged: (val) {
                                    setState(() {
                                      reminderList[0].isRepeat =
                                          !reminderList[0].isRepeat;
                                    });
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1A458F).withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ]);
  }

  IconButton _backButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.popRoute();
        },
        icon: const Icon(
          Icons.arrow_back,
          size: 25,
          color: Colors.white,
        ));
  }

  Padding _bellIcon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        AssetIcons.bell,
        height: 21,
        width: 20,
        color: const Color(0xffFF9333),
      ),
    );
  }

  Padding _menuIcon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        AssetIcons.menu,
        height: 21,
        width: 20,
        color: const Color(0xff23A6B1),
      ),
    );
  }

  Padding _logoImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        AssetImages.logo,
      ),
    );
  }

  Divider _divider() {
    return const Divider(
      color: Color(0xffEEF0FA),
      thickness: 1,
    );
  }

  Widget _calenderIcon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        AssetIcons.calender,
        height: 21,
        width: 20,
        color: const Color(0xffFF9333),
      ),
    );
  }

  Future<DateTime?> datePicker(BuildContext context) {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2500));
  }
}
