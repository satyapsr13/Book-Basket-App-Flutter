// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nhsbpmonitor/Constants/constants.dart';
import 'package:nhsbpmonitor/Constants/enums.dart';
import 'package:nhsbpmonitor/Constants/locations.dart';
import 'package:nhsbpmonitor/Logic/Cubit/user_profile_cubit/user_profile_cubit.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/drawer.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/primary_button.dart';
import 'package:nhsbpmonitor/Routes/routes.gr.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  //------------------------------------
  List<charts.Series> seriesList = [];
  // this variable is Just for testing...
  int serialNo = 1;
  @override
  void initState() {
    BlocProvider.of<UserProfileCubit>(context).fetchUserDetails();

    BlocProvider.of<UserProfileCubit>(context).fetchBPReadingList();

    super.initState();
  }

  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';

  List<UserHealthGraph> systolicRatingsGraphData = [];
  List<UserHealthGraph> diastolicRatingGraphData = [];
  charts.BarChart barChart() {
    var seriesList = [
      charts.Series<UserHealthGraph, String>(
        id: 'systolicRatings',
        domainFn: (UserHealthGraph systolicRatings, _) {
          return systolicRatings.dateTime.toString();
        },
        measureFn: (UserHealthGraph systolicRatings, _) {
          return systolicRatings.value;
        },
        data: systolicRatingsGraphData,
        fillColorFn: (UserHealthGraph value, _) {
          return charts.ColorUtil.fromDartColor(const Color(0xffFF9333));
        },
      ),
      charts.Series<UserHealthGraph, String>(
        id: 'diastolicRating',
        domainFn: (UserHealthGraph diastolicRating, _) =>
            diastolicRating.dateTime.toString(),
        measureFn: (UserHealthGraph diastolicRating, _) {
          return diastolicRating.value;
        },
        data: diastolicRatingGraphData,
        fillColorFn: (UserHealthGraph value, _) {
          // return charts.MaterialPalette.teal.shadeDefault;
          return charts.ColorUtil.fromDartColor(const Color(0xff23A6B1));
        },
      )..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
    ];
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
      barGroupingType: charts.BarGroupingType.grouped,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 1.0,
      ),
      behaviors: [
        // charts.ChartTitle(tr('blood_pressure'),
        //     behaviorPosition: charts.BehaviorPosition.top,
        //     titleOutsideJustification: charts.OutsideJustification.start,

        //     // Set a larger inner padding than the default (10) to avoid
        //     // rendering the text too close to the top measure axis tick label.
        //     // The top tick label may extend upwards into the top margin region
        //     // if it is located at the top of the draw area.
        //     innerPadding: 15),
        // charts.ChartTitle(tr(''),
        //     subTitle: 'Top sub-title text',
        //     behaviorPosition: charts.BehaviorPosition.top,
        //     titleOutsideJustification: charts.OutsideJustification.end,

        //     // Set a larger inner padding than the default (10) to avoid
        
        //     // rendering the text too close to the top measure axis tick label.
        //     // The top tick label may extend upwards into the top margin region
        //     // if it is located at the top of the draw area.
        //     innerPadding: 15),
        // title above secondry major axis
        charts.ChartTitle(
          tr('blood_pressure'),
          behaviorPosition: charts.BehaviorPosition.start,
          titleOutsideJustification: charts.OutsideJustification.middle,
          titleStyleSpec: const charts.TextStyleSpec(fontSize: 15),
          innerPadding: 2,
        ),
        // title above secondry major axis (systolic)
        charts.ChartTitle(
          tr('Heart Rate'),
          behaviorPosition: charts.BehaviorPosition.end,
          titleOutsideJustification: charts.OutsideJustification.middle,
          titleStyleSpec: const charts.TextStyleSpec(fontSize: 15),
          innerPadding: 8,
        ),
        charts.LinePointHighlighter(
          showHorizontalFollowLine: charts.LinePointHighlighterFollowLineType
              .nearest, // do not show follow line for diastolic
          showVerticalFollowLine: charts.LinePointHighlighterFollowLineType
              .nearest, // show follow line for systolic
        ),
        // charts.SeriesLegend(
        //   outsideJustification: charts.OutsideJustification.endDrawArea,
        //   horizontalFirst: false,
        //   desiredMaxRows: 2,
        //   showMeasures: true,
        //   // measureFormatter: (num value) {
        //   //   return value.toString();
        //   // },
        // ),
        charts.SlidingViewport(),
        //  charts.PanAndZoomBehavior(),
      ],
      domainAxis: charts.OrdinalAxisSpec(
          viewport: charts.OrdinalViewport('AePS', 5),
          renderSpec: charts.SmallTickRendererSpec(
              minimumPaddingBetweenLabelsPx: 0,

              // Tick and Label styling here.
              labelRotation: 30,
              labelStyle: const charts.TextStyleSpec(
                  fontSize: 12, // size in Pts.
                  color: charts.MaterialPalette.black),

              // Change the line colors to match text color.
              lineStyle: charts.LineStyleSpec(
                  color: charts.MaterialPalette.black.lighter))),

      /// Assign a custom style for the measure axis.

      secondaryMeasureAxis: const charts.NumericAxisSpec(
          tickProviderSpec:
              charts.BasicNumericTickProviderSpec(desiredTickCount: 5),
          renderSpec: charts.GridlineRendererSpec(

              // Tick and Label styling here.
              labelStyle: charts.TextStyleSpec(
                  fontSize: 8, // size in Pts.
                  color: charts.MaterialPalette.black),

              // Change the line colors to match text color.
              lineStyle:
                  charts.LineStyleSpec(color: charts.MaterialPalette.black))),

      primaryMeasureAxis: const charts.NumericAxisSpec(
          tickProviderSpec:
              charts.BasicNumericTickProviderSpec(desiredTickCount: 5),
          renderSpec: charts.GridlineRendererSpec(

              // Tick and Label styling here.
              labelStyle: charts.TextStyleSpec(
                  fontSize: 10, // size in Pts.
                  color: charts.MaterialPalette.black),

              // Change the line colors to match text color.
              lineStyle:
                  charts.LineStyleSpec(color: charts.MaterialPalette.black))),
      // layoutConfig: charts.LayoutConfig(
      //     leftMarginSpec: charts.MarginSpec.fixedPixel(10),
      //     topMarginSpec: charts.MarginSpec.fixedPixel(10),
      //     rightMarginSpec: charts.MarginSpec.fixedPixel(10),
      //     bottomMarginSpec: charts.MarginSpec.fixedPixel(10)),
    );
  }

  PatientStatus patientStatus = PatientStatus.healthy;

  // int _activeNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF0F4F6),
        key: _scaffoldKey,
        // bottomNavigationBar: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: SizedBox(
        //     height: 50,
        //     width: mediaquery.width,
        //     child: Row(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         InkWell(
        //           onTap: _activeNavIndex == 0
        //               ? null
        //               : () {
        //                   setState(() {
        //                     _activeNavIndex = 0;
        //                   });
        //                 },
        //           child: Column(
        //             children: [
        //               SvgPicture.asset(
        //                 AssetIcons.home,
        //                 height: 21,
        //                 width: 20,
        //                 color: activeColor(0),
        //               ),
        //               Text(
        //                 tr('home'),
        //                 style: TextStyle(color: activeColor(0)),
        //               ),
        //             ],
        //           ),
        //         ),
        //         InkWell(
        //           onTap: _activeNavIndex == 1
        //               ? null
        //               : () {
        //                   setState(() {
        //                     _activeNavIndex = 1;
        //                   });
        //                 },
        //           child: Column(
        //             children: [
        //               SvgPicture.asset(
        //                 AssetIcons.calendar,
        //                 height: 21,
        //                 width: 20,
        //                 color: activeColor(1),
        //               ),
        //               Text(
        //                 tr('calender'),
        //                 style: TextStyle(color: activeColor(1)),
        //               ),
        //             ],
        //           ),
        //         ),
        //         InkWell(
        //           onTap: _activeNavIndex == 2
        //               ? null
        //               : () {
        //                   setState(() {
        //                     _activeNavIndex = 2;
        //                   });
        //                 },
        //           child: Column(
        //             children: [
        //               SvgPicture.asset(
        //                 AssetIcons.bookOpen,
        //                 height: 21,
        //                 width: 20,
        //                 color: activeColor(2),
        //               ),
        //               Text(
        //                 tr('insights'),
        //                 style: TextStyle(color: activeColor(2)),
        //               ),
        //             ],
        //           ),
        //         ),
        //         InkWell(
        //           onTap: _activeNavIndex == 3
        //               ? null
        //               : () {
        //                   setState(() {
        //                     _activeNavIndex = 3;
        //                   });
        //                 },
        //           child: Column(
        //             children: [
        //               SvgPicture.asset(
        //                 AssetIcons.settings,
        //                 height: 21,
        //                 width: 20,
        //                 color: activeColor(3),
        //               ),
        //               Text(
        //                 tr('settings'),
        //                 style: TextStyle(color: activeColor(3)),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

        endDrawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: BlocBuilder<UserProfileCubit, UserProfileState>(
            builder: (context, state) {
              if (state.status == Status.loading) {
                return circulatProgressIndicator(mediaquery);
              }
              if (state.status == Status.tokenLoginFailed) {
                BlocProvider.of<UserProfileCubit>(context)
                    .loginWithAccessCodefromHomeScreen(context);
                log("---------token login failed-------------------------");
                return circulatProgressIndicator(mediaquery);
              }
              if (state.status == Status.failure) {
                return SizedBox(
                  height: mediaquery.height,
                  width: mediaquery.width,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${state.error}!"),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // context.router.root.push(const OnBoardingScreen());
                              context.replaceRoute(const OnBoardingScreen());
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xff23A6B1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.all(14),
                              elevation: 0,
                            ),
                            child: SizedBox(
                                height: 20,
                                width: mediaquery.width * 0.2,
                                child: const Center(child: Text('Login'))),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (state.bloodPressureList != null) {
                for (var data in state.bloodPressureList!) {
                  // setState(() {});
                  if (systolicRatingsGraphData.length > 7) {
                    systolicRatingsGraphData.removeAt(0);
                    diastolicRatingGraphData.removeAt(0);
                  }
                  systolicRatingsGraphData.add(UserHealthGraph(
                      DateFormat("dd-MM-yyyy hh:mm:ss").format(data.time!),
                      data.systolicBp ?? 0,
                      0));
                  diastolicRatingGraphData.add(UserHealthGraph(
                      DateFormat("dd-MM-yyyy hh:mm:ss").format(data.time!),
                      data.diastolicBp ?? 0,
                      0));
                }
              }

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
                          onTap: () {
                            context.pushRoute(const RemindersScreen());
                          },
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
                      SizedBox(
                        width: mediaquery.width,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  _indicatorButton(
                                      const Color(0xffFF9333), tr("systolic")),
                                  const Spacer(flex: 1),
                                  _indicatorButton(
                                      const Color(0xff23A6B1), tr("diastolic")),
                                  const Spacer(flex: 1),
                                  _indicatorButton(const Color(0xff333333),
                                      tr("heart_rate")),
                                  const Spacer(flex: 5),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FittedBox(
                                  child: SizedBox(
                                    height: mediaquery.height * 0.3,
                                    width: mediaquery.width * 0.85,
                                    child: systolicRatingsGraphData.isEmpty
                                        ? const Center(
                                            child: Text('Please add BP Reading',
                                                style: TextStyle()),
                                          )
                                        : barChart(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: mediaquery.height * 0.45),
                          Stack(
                            children: [
                              Container(
                                width: mediaquery.width,
                                // height: mediaquery.height,
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20)),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 50),
                                    Container(
                                      width: mediaquery.width,
                                      height: mediaquery.height * 0.5,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              topLeft: Radius.circular(20)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              blurRadius: 10.0,
                                              spreadRadius: 0.0,
                                              offset: const Offset(0.0, -15.0),
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                // height: mediaquery.height * 1.5,
                                child: Column(
                                  children: [
                                    ListView.separated(
                                      reverse: true,
                                      itemCount:
                                          (state.bloodPressureList == null)
                                              ? 0
                                              : state.bloodPressureList!.length,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (ctx, index) {
                                        log("");
                                        if (state.bloodPressureList![index]
                                                .resStatus ==
                                            "Green") {
                                          patientStatus = PatientStatus.healthy;
                                        } else if (state
                                                .bloodPressureList![index]
                                                .resStatus ==
                                            "Red") {
                                          patientStatus = PatientStatus.danger;
                                        } else {
                                          patientStatus = PatientStatus.warning;
                                        }
                                        return Center(
                                          child: Container(
                                            height:
                                                mediaquery.height * 0.22 + 50,
                                            width: mediaquery.width * 0.9,
                                            decoration: BoxDecoration(
                                              color: patientStatus ==
                                                      PatientStatus.healthy
                                                  ? const Color(0xff127E65)
                                                  : patientStatus ==
                                                          PatientStatus.danger
                                                      ? const Color(0xffB22F2A)
                                                      : const Color(0xffB8610B),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height:
                                                      mediaquery.height * 0.22,
                                                  width: mediaquery.width * 0.9,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    gradient: LinearGradient(
                                                      colors: patientStatus ==
                                                              PatientStatus
                                                                  .healthy
                                                          ? [
                                                              const Color(
                                                                  0xff25A969),
                                                              const Color(
                                                                  0xff23A6B1),
                                                            ]
                                                          : patientStatus ==
                                                                  PatientStatus
                                                                      .danger
                                                              ? [
                                                                  const Color(
                                                                      0xffF84F48),
                                                                  const Color(
                                                                      0xffEB2820)
                                                                ]
                                                              : [
                                                                  const Color(
                                                                      0xffE59B1B),
                                                                  const Color(
                                                                      0xffFF9333),
                                                                ],
                                                      begin: Alignment.topRight,
                                                      end: Alignment.bottomLeft,
                                                      stops: const [0, 1],
                                                    ),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 18,
                                                                top: 15),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  tr("blood_pressure"),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                FittedBox(
                                                                  child: Text(
                                                                    "${DateFormat('hh:mm a').format(state.bloodPressureList![index].time ?? DateTime.now())} , ${state.bloodPressureList![index].time!.day} ${intToMonth[state.bloodPressureList![index].time!.month]} , ${intToWeekDay[state.bloodPressureList![index].time!.weekday]} ",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            patientStatus ==
                                                                    PatientStatus
                                                                        .healthy
                                                                ? _greenBulbImage()
                                                                : patientStatus ==
                                                                        PatientStatus
                                                                            .danger
                                                                    ? _redBulbImage()
                                                                    : _yellowBulbImage(),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Spacer(flex: 1),
                                                          GlassCardWIdget(
                                                              title: "SYS",
                                                              value: state
                                                                      .bloodPressureList![
                                                                          index]
                                                                      .systolicBp ??
                                                                  0),
                                                          const Spacer(flex: 1),
                                                          GlassCardWIdget(
                                                              title: "DYA",
                                                              value: state
                                                                      .bloodPressureList![
                                                                          index]
                                                                      .diastolicBp ??
                                                                  0),
                                                          const Spacer(flex: 1),
                                                          // GlassCardWIdget(
                                                          //     title: "PUL",
                                                          //     value: state
                                                          //             .bloodPressureList![
                                                          //                 index]
                                                          //             .pulse ??
                                                          //         0),
                                                          // const Spacer(flex: 2),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: SizedBox(
                                                    height: 50,
                                                    width:
                                                        mediaquery.width * 0.9,
                                                    child: Center(
                                                      child: Text(
                                                        patientStatus ==
                                                                PatientStatus
                                                                    .healthy
                                                            ? 'Everything is normal '
                                                            : patientStatus ==
                                                                    PatientStatus
                                                                        .danger
                                                                ? "Consult with doctor"
                                                                : "Warning! Be carefull again check after sometime.",
                                                        textAlign:
                                                            TextAlign.center,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color: patientStatus ==
                                                                    PatientStatus
                                                                        .healthy
                                                                ? const Color(
                                                                    0xff6AEAEA)
                                                                : patientStatus ==
                                                                        PatientStatus
                                                                            .danger
                                                                    ? const Color(
                                                                        0xffFFD7B0)
                                                                    : const Color(
                                                                        0xffFFD7B0),
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const SizedBox(height: 20);
                                      },
                                    ),
                                    SizedBox(height: mediaquery.height * 0.1),
                                    PrimaryButton(
                                      onPressed: () {
                                        context.pushRoute(const BPReading());
                                      },
                                      buttonText: tr("add_card"),
                                    ),
                                    SizedBox(height: mediaquery.height * 0.1),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget circulatProgressIndicator(Size mediaquery) {
    return SizedBox(
        height: mediaquery.height,
        width: mediaquery.width,
        child: const Center(
            child: CircularProgressIndicator(
          color: Color(0xff23A6B1),
        )));
  }

  // Color activeColor(int index) {
  //   return index == _activeNavIndex ? const Color(0xff23A6B1) : Colors.black;
  // }

  Padding _greenBulbImage() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Image.asset(
        AssetImages.greenBulb,
      ),
    );
  }

  Padding _yellowBulbImage() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Image.asset(
        AssetImages.yellowBulb,
      ),
    );
  }

  Padding _redBulbImage() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Image.asset(
        AssetImages.redBulb,
      ),
    );
  }

  Container _indicatorButton(Color colors, String data) {
    return Container(
      // height: 35,
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            data,
            style: const TextStyle(
              // capital text
              color: Colors.white,
            ),
          ),
        ),
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

  Padding _logoImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        AssetImages.logo,
      ),
    );
  }

  Text title(String data) {
    return Text(
      tr(data),
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Color(0xff0F2851),
      ),
    );
  }

  Text info(String data) {
    return Text(
      tr(data),
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Color(0xff8D9BB4),
      ),
    );
  }
}

class GlassCardWIdget extends StatelessWidget {
  const GlassCardWIdget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xffEDFF81),
            ),
          ),
          FittedBox(
            child: Text(
              (value == 0) ? "..." : value.toString(),
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserHealthGraph {
  final String dateTime;
  final int value;
  final int pulse;

  UserHealthGraph(this.dateTime, this.value, this.pulse);
}
