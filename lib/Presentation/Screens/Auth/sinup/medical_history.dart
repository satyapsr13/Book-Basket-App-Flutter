// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, sort_child_properties_last
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nhsbpmonitor/Constants/enums.dart';
import 'package:nhsbpmonitor/Logic/Cubit/user_profile_cubit/user_profile_cubit.dart';

import 'package:nhsbpmonitor/Presentation/Widgets/gradient_screen_widget.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/primary_button.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/snackbar.dart';
import 'package:nhsbpmonitor/Routes/routes.gr.dart';
import 'package:nhsbpmonitor/constants/locations.dart';

class MedicalHistory extends StatefulWidget {
  // const MedicalHistory({Key? key}) : super(key: key);
  String bloodGroup;
  String weight;
  String height;
  String state;
  String city;
  MedicalHistory({
    Key? key,
    required this.bloodGroup,
    required this.weight,
    required this.height,
    required this.state,
    required this.city,
  }) : super(key: key);

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController bookingBMIController = TextEditingController();
  TextEditingController currentBMIController = TextEditingController();
  TextEditingController date_of_birthController = TextEditingController();
  DateTime birthDate = DateTime.now();
  // final _formKey = GlobalKey<FormState>();

  bool isVisible = true;
  String ethinicCategory = "white";
  String smoker_atbooking = "Yes";
  String userAge = "40";
  final ageList = [
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
    "60",
    "61",
    "62",
    "63",
    "64",
    "65",
    "66",
    "67",
    "68",
    "69",
    "70",
    "71",
    "72",
    "73",
    "74",
    "75",
    "76",
    "77",
    "78",
    "79",
    "80",
  ];
  final bloodGroupList = [
    "AB+",
    "O+",
    "B+",
  ];
  final ethinicCategoryList = [
    "white",
    "Black",
    "South Asian",
    "Chinese",
    "Mixed",
    "Other",
  ];
  final smoker_atbookingList = [
    "Yes",
    "No",
  ];
  String birth_before_pregnency = "1";
  final birth_before_pregnencyList = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
  ];
  @override
  Widget build(BuildContext context) {
    UserProfileCubit userProfileCubit =
        BlocProvider.of<UserProfileCubit>(context);

    final mediaquery = MediaQuery.of(context).size;
    return BlocListener<UserProfileCubit, UserProfileState>(
      listener: (context, state) {
        if (state.status == Status.failure) {
          showSnackBar(context, Colors.red, state.error);
        } else if (state.status == Status.success) {
          showSnackBar(context, Colors.green,
              "Successfully added. Please Login now.");
          context.replaceRoute(SignInWithUserName());
        }
      },
      child: GradientScreen(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: mediaquery.width,
              height: 70,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    _logoImage(),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: mediaquery.height * 0.03),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.popRoute();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        tr('medical_history'),
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: mediaquery.height * 0.03),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title("ethnic_category_display"),
                          Container(
                            width: mediaquery.width * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: DropdownButton(
                              menuMaxHeight: mediaquery.height * 0.5,
                              focusColor: Colors.white,
                              underline: Text(''),
                              isExpanded: true,
                              style: TextStyle(color: Colors.white),
                              items: ethinicCategoryList
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              hint: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  ethinicCategory,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  ethinicCategory = value.toString();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title("Smoker_atbooking"),
                          Container(
                            width: mediaquery.width * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: DropdownButton(
                              menuMaxHeight: mediaquery.height * 0.5,
                              focusColor: Colors.white,
                              underline: Text(''),
                              isExpanded: true,
                              style: TextStyle(color: Colors.white),
                              items: smoker_atbookingList
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              hint: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  smoker_atbooking,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  smoker_atbooking = value.toString();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title("age"),
                          Container(
                            width: mediaquery.width * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: DropdownButton(
                              menuMaxHeight: mediaquery.height * 0.5,
                              enableFeedback: true,
                              elevation: 16,
                              focusColor: Colors.white,
                              underline: Text(''),
                              isExpanded: true,
                              style: TextStyle(color: Colors.white),
                              items: ageList.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              hint: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  userAge,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  userAge = value.toString();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title("Births Before This Pregnancy"),
                          Container(
                            width: mediaquery.width * 0.5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: DropdownButton(
                              menuMaxHeight: mediaquery.height * 0.5,
                              focusColor: Colors.white,
                              underline: Text(''),
                              isExpanded: true,
                              style: TextStyle(color: Colors.white),
                              items: birth_before_pregnencyList
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              hint: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  birth_before_pregnency,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  birth_before_pregnency = value.toString();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: mediaquery.height * 0.02),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title("booking_bmi"),
                          inputField(bookingBMIController, false, mediaquery,
                              "Lorem ", true),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title("current_bmi"),
                          inputField(currentBMIController, false, mediaquery,
                              "Epsum", true),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(height: mediaquery.height * 0.08),
                  BlocBuilder<UserProfileCubit, UserProfileState>(
                    builder: (context, state) {
                      return PrimaryButton(
                        onPressed: () {
                          if (true) {
                            userProfileCubit.updateUserProfile(
                                widget.bloodGroup,
                                widget.weight,
                                widget.height,
                                widget.state,
                                widget.city,
                                ethinicCategory,
                                smoker_atbooking,
                                userAge,
                                birth_before_pregnency,
                                bookingBMIController.text,
                                currentBMIController.text);
                          }
                        },
                        buttonText: tr("save"),
                        isLoading: state.status == Status.loading,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
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

  Widget title(String key) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        tr(key),
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  TextFormField inputField(TextEditingController userNameController,
      bool obscureText2, Size mediaquery, String hintText2, bool isHalfSized) {
    return TextFormField(
      controller: userNameController,
      obscureText: obscureText2,
      validator: (val) {
        if (val!.isEmpty) {
          return "Please enter value";
        }
        return null;
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        focusedBorder: borderRadius(),
        focusedErrorBorder: borderRadius(),
        disabledBorder: borderRadius(),
        enabledBorder: borderRadius(),
        constraints: BoxConstraints(
            maxWidth: mediaquery.width * (isHalfSized ? 0.4 : 0.85),
            maxHeight: 50),
        hintText: hintText2,
        fillColor: Colors.white,
      ),
    );
  }

  OutlineInputBorder borderRadius() {
    return OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(3));
  }
}
