// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nhsbpmonitor/Constants/enums.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:nhsbpmonitor/Constants/locations.dart';
import 'package:nhsbpmonitor/Logic/Cubit/user_profile_cubit/user_profile_cubit.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/drawer.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/primary_button.dart';
import 'package:nhsbpmonitor/Routes/routes.gr.dart';
// import 'package:nhsbpmonitor/Presentation/Widgets/gradient_screen_widget.dart';

class PregnancyDetailsEditScreen extends StatefulWidget {
  const PregnancyDetailsEditScreen({Key? key}) : super(key: key);

  @override
  State<PregnancyDetailsEditScreen> createState() =>
      _PregnancyDetailsEditScreenState();
}

class _PregnancyDetailsEditScreenState
    extends State<PregnancyDetailsEditScreen> {
  String status = "Healthy";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController noOfChildrenController =
      TextEditingController(text: "1");
  TextEditingController previousHypertensionController =
      TextEditingController(text: "N/A");
  TextEditingController hypertensionOutsidePregnencyController =
      TextEditingController(text: "N/A");
  TextEditingController currentMedicationController =
      TextEditingController(text: "N/A");
  bool canEdit = true;
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF0F4F6),
        key: _scaffoldKey,
        // appBar: RoundedAppBar(),
        endDrawer: MyDrawer(),
        body: SingleChildScrollView(
          child: BlocBuilder<UserProfileCubit, UserProfileState>(
              builder: (context, state) {
            if (state.status == Status.loading) {
              return SizedBox(
                  height: mediaquery.height,
                  width: mediaquery.width,
                  child: Center(
                      child: CircularProgressIndicator(
                    color: const Color(0xff23A6B1),
                  )));
            }
            if (state.status == Status.failure) {
              return SizedBox(
                height: mediaquery.height,
                width: mediaquery.width,
                child: Center(
                  child: Text(
                    "${state.error} please try again.",
                  ),
                ),
              );
            }
            // noOfChildrenController.text = "${state.userData?.numberOfChildren}";
            // previousHypertensionController.text =
            //     "${state.userData?.hypertension}";
            return Column(
              children: [
                Container(
                  width: mediaquery.width,
                  height: 70,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          AssetImages.logo,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          context.replaceRoute(RemindersScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            AssetIcons.bell,
                            height: 21,
                            width: 20,
                            color: Color(0xffFF9333),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _scaffoldKey.currentState!.openEndDrawer();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            AssetIcons.menu,
                            height: 21,
                            width: 20,
                            color: Color(0xff23A6B1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: mediaquery.width,
                      height: 70,
                      color: Color(0xff23A6B1).withOpacity(0.5),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                context.popRoute();
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                size: 25,
                                color: Colors.white,
                              )),
                          Text(
                            tr('pregnancy_details'),
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: mediaquery.width,
                      height: 70,
                      child: Image.asset(AssetImages.doctorWithStethoscope,
                          fit: BoxFit.cover),
                    ),
                  ],
                ),
                Container(
                  width: mediaquery.width,
                  // height: 80,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   state.userData?.firstName ?? "",
                            //   textScaleFactor: 1.5,
                            // ),
                            // Text('${state.userData?.firstName} yrs'),
                          ],
                        ),
                        const Spacer(
                          flex: 6,
                        ),
                        // InkWell(
                        //   onTap: () {},
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //         border: Border.all(
                        //       color: Color(0xffFF9333),
                        //       width: 1,
                        //     )),
                        //     child: Padding(
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 10, vertical: 7),
                        //       child: Row(
                        //         children: [
                        //           const Icon(
                        //             Icons.edit,
                        //             size: 15,
                        //             color: Color(0xffFF9333),
                        //           ),
                        //           Text(
                        //             'Edit',
                        //             style: const TextStyle(
                        //               color: Color(0xff23A6B1),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: mediaquery.height * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              title("Pregnancy Number"),
                              info("15689456"),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              title("Hospital Name"),
                              info("Lorem Ipsum"),
                            ],
                          ),
                          const Spacer()
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        color: Color(0xffE6E9F1),
                        thickness: 1,
                      ),
                      const SizedBox(height: 10),
                      title("Nuber of Children"),
                      const SizedBox(height: 10),
                      TextFormField(
                        readOnly: !canEdit,
                        controller: noOfChildrenController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none),
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        color: Color(0xffE6E9F1),
                        thickness: 1,
                      ),
                      const SizedBox(height: 10),
                      title(
                          "Previous Hypertension in Pregnancy or Preeclampsia"),
                      const SizedBox(height: 10),
                      TextFormField(
                        readOnly: !canEdit,
                        controller: previousHypertensionController,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none),
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        color: Color(0xffE6E9F1),
                        thickness: 1,
                      ),
                      const SizedBox(height: 10),
                      title("Hypertension outside pregnancy"),
                      const SizedBox(height: 10),
                      TextFormField(
                        readOnly: !canEdit,
                        controller: hypertensionOutsidePregnencyController,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none),
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        color: Color(0xffE6E9F1),
                        thickness: 1,
                      ),
                      const SizedBox(height: 10),
                      title("Current Medication for Hypertension"),
                      const SizedBox(height: 10),
                      TextFormField(
                        readOnly: !canEdit,
                        controller: currentMedicationController,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: mediaquery.height * 0.05),
                SecondryButton(
                  onPressed: () {},
                  buttonText: tr("save"),
                  // isLoading: true,
                ),
                SizedBox(height: mediaquery.height * 0.05),
              ],
            );
          }),
        ),
      ),
    );
  }

  Text title(String data) {
    return Text(
      tr(data),
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Color(0xff0F2851),
      ),
    );
  }

  Text info(String data) {
    return Text(
      tr(data),
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Color(0xff8D9BB4),
      ),
    );
  }
}
