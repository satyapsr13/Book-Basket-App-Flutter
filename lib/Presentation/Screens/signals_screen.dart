// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:nhsbpmonitor/Constants/enums.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nhsbpmonitor/Constants/locations.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/drawer.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/gradient_screen_widget.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/primary_button.dart';
import 'package:nhsbpmonitor/Routes/routes.gr.dart';
// import 'package:nhsbpmonitor/Presentation/Widgets/gradient_screen_widget.dart';

class SignalScreen extends StatefulWidget {
  PatientStatus patientStatus;
  SignalScreen({
    Key? key,
    required this.patientStatus,
  }) : super(key: key);
  @override
  State<SignalScreen> createState() => _SignalScreenState();
}

class _SignalScreenState extends State<SignalScreen> {
  // String status = "Danger";
  // PatientStatus patientStatus = PatientStatus.danger;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xffF0F4F6),
            key: _scaffoldKey,
            // appBar: RoundedAppBar(),
            endDrawer: MyDrawer(),
            body: Stack(
              children: [
                Container(
                  height: mediaquery.height,
                  width: mediaquery.width,
                  color: Color(0xff333333),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
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
                                  // Scaffold.of(context).openDrawer();
                                },
                                child: _menuIcon(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: mediaquery.height * 0.08),
                        Image.asset(
                          // AssetImages.greenSignal,
                          widget.patientStatus == PatientStatus.healthy
                              ? AssetImages.greenSignal
                              : widget.patientStatus == PatientStatus.warning
                                  ? AssetImages.yellowSignal
                                  : AssetImages.redSignal,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                        // height: mediaquery.height * 0.3,
                        width: mediaquery.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                          color: widget.patientStatus == PatientStatus.healthy
                              ? Color(0xff79F7AE)
                              : widget.patientStatus == PatientStatus.warning
                                  ? Color(0xffEFAA33)
                                  : Color(0xffEB2820),
                        ),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: mediaquery.height * 0.05),
                            SizedBox(
                              width: mediaquery.width * 0.7,
                              child: Center(
                                child: Text(
                                  widget.patientStatus == PatientStatus.healthy
                                      ? 'Everything is normal and take next reading as per schedule.'
                                      : widget.patientStatus ==
                                              PatientStatus.warning
                                          ? "Repeat after 30 mins or call on Hospital number"
                                          : "Repeat after 30 mins or call on Hospital number",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: widget.patientStatus ==
                                            PatientStatus.danger
                                        ? Colors.white
                                        : Color(0xff333333),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: mediaquery.height * 0.05),
                            widget.patientStatus == PatientStatus.danger
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // PrimaryButton(
                                      //   onPressed: () {
                                      //     // setState(() {
                                      //     //   widget.patientStatus = PatientStatus.healthy;
                                      //     // });
                                      //   },
                                      //   buttonText: tr("done"),
                                      //   isHalfSize: true,
                                      // ),
                                      PrimaryButton(
                                        onPressed: () {
                                          // setState(() {
                                          //   widget.patientStatus =
                                          //       PatientStatus.warning;
                                          // });
                                        },
                                        buttonText: tr("send_message"),
                                        // isHalfSize: true,
                                      ),
                                    ],
                                  )
                                : Visibility(
                                    visible: 1==0,
                                    child: PrimaryButton(
                                      onPressed: () {
                                        context.pushRoute(HomeScreen());
                                      },
                                      buttonText: tr("done"),
                                    ),
                                  ),
                            const SizedBox(height: 20),
                            PrimaryButton(
                              onPressed: () {
                                context.replaceRoute(HomeScreen());
                              },
                              buttonText: tr("Goto Graph"),
                            ),
                            const SizedBox(height: 30),
                          ],
                        )))
              ],
            )));
  }

  Padding _menuIcon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        AssetIcons.menu,
        height: 21,
        width: 20,
        color: Color(0xff23A6B1),
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
        color: Color(0xffFF9333),
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
}

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RoundedAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return AppHeader(
      mediaquery: mediaquery,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
