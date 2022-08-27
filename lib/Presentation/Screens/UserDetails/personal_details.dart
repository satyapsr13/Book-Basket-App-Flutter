import 'dart:developer';

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
import 'package:nhsbpmonitor/Presentation/Widgets/snackbar.dart';
import 'package:nhsbpmonitor/Routes/routes.gr.dart';
import 'package:nhsbpmonitor/Utility/common.dart';
// import 'package:nhsbpmonitor/Presentation/Widgets/gradient_screen_widget.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  TextEditingController undatedWeightController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // BlocProvider.of<UserProfileCubit>(context).fetchLastBPReading();
    BlocProvider.of<UserProfileCubit>(context).fetchLastWeight();
    BlocProvider.of<UserProfileCubit>(context).fetchUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserProfileCubit userProfileCubit =
        BlocProvider.of<UserProfileCubit>(context);
    final mediaquery = MediaQuery.of(context).size;
    return BlocListener<UserProfileCubit, UserProfileState>(
      listener: (context, state) {
        if (state.status == Status.updateSuccess) {
          Navigator.pop(context);
          showSnackBar(context, Colors.green, "Weight updated successfully");
          BlocProvider.of<UserProfileCubit>(context).fetchUserDetails();
          BlocProvider.of<UserProfileCubit>(context).fetchLastWeight();
          BlocProvider.of<UserProfileCubit>(context).fetchLastBPReading();
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffF0F4F6),
          key: _scaffoldKey,
          endDrawer: const MyDrawer(),
          body: SingleChildScrollView(
            child: BlocBuilder<UserProfileCubit, UserProfileState>(
                builder: (context, state) {
              if (state.status == Status.loading) {
                return SizedBox(
                    height: mediaquery.height,
                    width: mediaquery.width,
                    child: const Center(
                        child: CircularProgressIndicator(
                            color: Color(0xff23A6B1))));
              }
              if (state.status == Status.failure) {
                return SizedBox(
                  height: mediaquery.height,
                  width: mediaquery.width,
                  child: Center(
                    child: Text("${state.error} please try again."),
                  ),
                );
              }

              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                        width: mediaquery.width,
                        height: 70,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(AssetImages.logo),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                context.replaceRoute(const RemindersScreen());
                              },
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: _bellIcon()),
                            ),
                            InkWell(
                              onTap: () {
                                _scaffoldKey.currentState!.openEndDrawer();
                              },
                              child: _menuIcon(),
                            ),
                          ],
                        )),
                    Stack(
                      children: [
                        Container(
                          width: mediaquery.width,
                          height: 70,
                          color: const Color(0xff23A6B1).withOpacity(0.5),
                          child: Row(
                            children: [
                              _backButton(context),
                              Text(
                                tr('personal_details'),
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
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Icon(
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
                                // Text('${state.userData?.dob} yrs'),
                              ],
                            ),
                            const Spacer(
                              flex: 5,
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
                                  title(tr("date_of_birth")),
                                  // info(state.userData?.dob.toString() ?? ""),
                                ],
                              ),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(color: Color(0xffE6E9F1), thickness: 1),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  title(tr("mobile_number")),
                                  // info(state.userData?.phoneNumber ?? ""),
                                ],
                              ),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(color: Color(0xffE6E9F1), thickness: 1),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  title(tr("ethnicity")),
                                  // info(state.userData?.normalizedEmail ?? ""),
                                ],
                              ),
                              // const Spacer(),

                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  title(tr("due_date_by_scan")),
                                  info(formatDate(DateTime.now())),
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
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  title(tr("single_or_twins_pregnancy")),
                                  info("Twins"),
                                ],
                              ),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            color: Color(0xffE6E9F1),
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              Text(
                                tr('basic_info'),
                                style: const TextStyle(
                                  color: Color(0xff23A6B1),
                                  fontSize: 18,
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () async {
                                  log(state.lastWeignt ?? "");
                                  undatedWeightController.text =
                                      state.lastWeignt ?? "";
                                  await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          title: SizedBox(
                                            width: mediaquery.width * 0.95,
                                            child: Text(
                                              tr("update_your_weight"),
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          content: TextFormField(
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return tr(
                                                    "field_can_not_be_empty");
                                              }
                                              return null;
                                            },
                                            maxLength: 4,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            controller: undatedWeightController,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              fillColor:
                                                  const Color(0xffEFF4FD),
                                              filled: true,
                                            ),
                                          ),
                                          actions: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: BlocBuilder<
                                                      UserProfileCubit,
                                                      UserProfileState>(
                                                  builder: (context, state) {
                                                return SecondryButton(
                                                    onPressed: () {
                                                      if (_formKey.currentState!
                                                          .validate()) {
                                                        userProfileCubit
                                                            .updateWeight(
                                                                undatedWeightController
                                                                    .text);
                                                      }
                                                    },
                                                    buttonText: tr("update"),
                                                    isLoading: state.status ==
                                                        Status.updatePending);
                                              }),
                                            )
                                          ],
                                        );
                                      });
                                },
                                child: Text(
                                  tr('update_weight'),
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xffFF9333),
                                    fontSize: 13,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            color: Color(0xffE6E9F1),
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  title(tr("blood_group")),
                                  // info(state.userData?.firstName ?? ""),
                                ],
                              ),
                              // const Spacer(),

                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  title(tr("weight")),
                                  info(state.lastWeignt ?? ""),
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
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  title(tr("body_type")),
                                  info("Twins"),
                                ],
                              ),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            color: Color(0xffE6E9F1),
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              Text(
                                tr('medical_history'),
                                style: const TextStyle(
                                  color: Color(0xff23A6B1),
                                  fontSize: 18,
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  // context.pushRoute(MedicalHistory(
                                  //     bloodGroup: 'O+',
                                  //     city: 'city',
                                  //     height:
                                  //         state.userData?.lastName.toString() ??
                                  //             "",
                                  //     state: 'state',
                                  //     weight:
                                  //         state.userData?.lastName.toString() ??
                                  //             ""));
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.mode_edit_outlined,
                                      color: Color(0xffFF9333),
                                      size: 13,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        tr("edit"),
                                        style: const TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xff3A3A3A),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            color: Color(0xffE6E9F1),
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  title(tr("ethnic_category_display")),
                                  // info(state.userData?.lastName.toString() ??
                                  //     ""),
                                ],
                              ),
                              // const Spacer(),

                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  title(tr("smoker_atbooking")),
                                  info("lorem"),
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
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  title(tr("age_at_delivery")),
                                  // info(state.userData?.lastName.toString() ??
                                  //     ""),
                                ],
                              ),
                              // const Spacer(),

                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  title(tr("births_before_this_pregnancy")),
                                  // info(state
                                  //         .userData?.numberOfPreviousPregnancies
                                  //         .toString() ??
                                  //     ""),
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
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  title(tr("booking_bmi")),
                                  info("26"),
                                ],
                              ),
                              // const Spacer(),

                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  title(tr("current_bmi")),
                                  info(tr("yes")),
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
                          Row(
                            children: [
                              Text(
                                tr('add_BP_readings'),
                                style: const TextStyle(
                                  color: Color(0xff23A6B1),
                                  fontSize: 18,
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  context.pushRoute(const BPReading());
                                },
                                child: Row(children: [
                                  const Icon(
                                    Icons.mode_edit_outlined,
                                    color: Color(0xffFF9333),
                                    size: 13,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(tr("edit"),
                                          style: const TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xff3A3A3A),
                                            fontSize: 13,
                                          )))
                                ]),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(color: Color(0xffE6E9F1), thickness: 1),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  title(tr("enter_SYS_ratings")),
                                  info(state.lastBPReading?.systolicBp
                                          .toString() ??
                                      ""),
                                ],
                              ),
                              // const Spacer(),

                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  title(tr("enter_DYA_ratings")),
                                  info(state.lastBPReading?.diastolicBp
                                          .toString() ??
                                      ""),
                                ],
                              ),
                              const Spacer()
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(color: Color(0xffE6E9F1), thickness: 1),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  title(tr("enter_pulse")),
                                  info(state.lastBPReading?.pulse.toString() ??
                                      ""),
                                ],
                              ),
                              const Spacer(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: mediaquery.height * 0.05),
                    SecondryButton(
                      onPressed: () {},
                      buttonText: tr("save"),
                    ),
                    SizedBox(height: mediaquery.height * 0.1),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
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

  SvgPicture _bellIcon() {
    return SvgPicture.asset(
      AssetIcons.bell,
      height: 21,
      width: 20,
      color: const Color(0xffFF9333),
    );
  }

  Text title(String data) {
    return Text(
      data,
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
