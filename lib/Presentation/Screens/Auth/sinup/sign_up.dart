// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nhsbpmonitor/Constants/enums.dart';
import 'package:nhsbpmonitor/Logic/Cubit/auth_cubit/auth_cubit.dart';
// import 'package:nhsbpmonitor/Presentation/Screens/Auth/signin/sign_in_with_username.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/gradient_screen_widget.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/primary_button.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/snackbar.dart';
import 'package:nhsbpmonitor/Routes/routes.gr.dart';
import 'package:nhsbpmonitor/Utility/common.dart';
import 'package:nhsbpmonitor/constants/locations.dart';

class SignUpScreen extends StatefulWidget {
  String? accessCode;
  SignUpScreen({
    Key? key,
    this.accessCode,
  }) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController mobileNoController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController date_of_birthController = TextEditingController();
  bool get isInDebugMode {
    bool inDebugMode = false;
    assert(inDebugMode = true);
    return inDebugMode;
  }

// for testing purpose only in debug mode
  void setCredentials() {
    userNameController.text = "test${DateTime.now().day}";
    passwordController.text = "Test@123";
    firstNameController.text = "firstName";
  }

  @override
  void initState() {
    // TODO: implement initState
    if (isInDebugMode) {
      setCredentials();
    }
    super.initState();
  }

  String gender = "Male";
  String countryCode = "+44";
  DateTime birthDate = DateTime.now();
  bool isVisible = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return GradientScreen(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == Status.failure) {
            showSnackBar(context, Colors.red,
                state.message ?? "Sinup Error ! Try Again");
          } else if (state.status == Status.success) {
            showSnackBar(context, Colors.green,
                "Successfully signup. Please fill you details.");
            context.replaceRoute(BasicInfo());
          }
        },
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _whiteLogoImage(),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr('signup'),
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            title("first_name"),
                            TextFormField(
                              controller: firstNameController,
                              textCapitalization: TextCapitalization.sentences,
                              validator: (value) => nullEmptyValidation(
                                  value, "Please enter first name!"),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                focusedBorder: borderRadius(),
                                errorBorder: borderRadius(),
                                focusedErrorBorder: borderRadius(),
                                disabledBorder: borderRadius(),
                                enabledBorder: borderRadius(),
                                constraints: BoxConstraints(
                                  maxWidth: mediaquery.width * 0.4,
                                ),
                                hintText: "Lorem",
                                fillColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            title("last_name"),
                            TextFormField(
                              textCapitalization: TextCapitalization.sentences,
                              controller: lastNameController,
                              validator: (value) => nullEmptyValidation(
                                  value, "Please enter last name!"),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                focusedBorder: borderRadius(),
                                errorBorder: borderRadius(),
                                focusedErrorBorder: borderRadius(),
                                disabledBorder: borderRadius(),
                                enabledBorder: borderRadius(),
                                constraints: BoxConstraints(
                                  maxWidth: mediaquery.width * 0.4,
                                ),
                                hintText: "Epsum",
                                fillColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                    title("date_of_birth"),
                    TextFormField(
                      onTap: () async {
                        datePicker(context).then((value) {
                          setState(() {
                            birthDate = value ?? birthDate;
                            date_of_birthController.text =
                                formatDateSlash(birthDate).toString();
                          });
                        });
                      },
                      controller: date_of_birthController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        focusedBorder: borderRadius(),
                        errorBorder: borderRadius(),
                        focusedErrorBorder: borderRadius(),
                        disabledBorder: borderRadius(),
                        enabledBorder: borderRadius(),
                        constraints:
                            BoxConstraints(maxWidth: mediaquery.width * (0.85)),
                        hintText: formatDateSlash(DateTime.now()).toString(),
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    title("mobile_no"),
                    TextFormField(
                      maxLength: 10,
                      controller: mobileNoController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Plese enter field";
                        }
                        if (val.length < 10) {
                          return "Phone No. can not be less than 10 digits.";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        focusedBorder: borderRadius(),
                        errorBorder: borderRadius(),
                        focusedErrorBorder: borderRadius(),
                        disabledBorder: borderRadius(),
                        enabledBorder: borderRadius(),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            color: Colors.transparent,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                focusColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                items: _countryCodeList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                                hint: Text(
                                  countryCode,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    countryCode = value.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: mediaquery.width * (0.85),
                        ),
                        hintText: "",
                        fillColor: Colors.white,
                      ),
                    ),
                    title("user_name"),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Field is required.";
                        }
                        return null;
                      },
                      controller: userNameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        focusedBorder: borderRadius(),
                        errorBorder: borderRadius(),
                        focusedErrorBorder: borderRadius(),
                        disabledBorder: borderRadius(),
                        enabledBorder: borderRadius(),
                        constraints: BoxConstraints(
                          maxWidth: mediaquery.width * (0.85),
                        ),
                        hintText: "lorem",
                        fillColor: Colors.white,
                      ),
                    ),
                    title("password"),
                    TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: passwordController,
                      obscureText: isVisible,
                      validator: (val) {
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

                        if (val!.isEmpty) {
                          return "Plese enter field";
                        }
                        if (val.length < 6) {
                          return "Passwords must be at least 6 characters.";
                        }
                        if (regex.hasMatch(val) == false) {
                          return '''Password must contains
                          Minimum 1 Upper case
                          Minimum 1 lowercase
                          Minimum 1 Numeric Number
                          Minimum 1 Special Character''';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        focusedBorder: borderRadius(),
                        errorBorder: borderRadius(),
                        focusedErrorBorder: borderRadius(),
                        disabledBorder: borderRadius(),
                        enabledBorder: borderRadius(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon(
                            !isVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: mediaquery.width * (0.85),
                          // maxHeight: 55,
                          // minHeight: 55,
                        ),
                        hintText: "",
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(height: mediaquery.height * 0.08),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return PrimaryButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              authCubit.sinupUser(
                                  userNameController.text,
                                  firstNameController.text,
                                  lastNameController.text,
                                  birthDate.toUtc().toIso8601String(),
                                  passwordController.text,
                                  widget.accessCode ?? "",
                                  mobileNoController.text);
                            }
                            // context.pushRoute(BasicInfo());
                          },
                          buttonText: tr("next"),
                          isLoading: state.status == Status.loading,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  Text(
                    'have an account?',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.pushRoute(SignInWithUserName());
                    },
                    child: Text(
                      tr("signin"),
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Image _whiteLogoImage() {
    return Image.asset(
      AssetImages.whiteLogo,
      height: 150,
      width: 150,
    );
  }

  List<String> get _countryCodeList {
    return [
      "+1",
      "+7",
      "+20",
      "+27",
      "+30",
      "+31",
      "+32",
      "+33",
      "+34",
      "+36",
      "+39",
      "+41",
      "+43",
      "+44",
      "+45",
      "+46",
      "+47",
      "+48",
      "+49",
      "+51",
      "+52",
      "+53",
      "+54",
      "+55",
      "+56",
      "+57",
      "+58",
      "+60",
      "+61",
      "+62",
      "+63",
      "+64",
      "+65",
      "+66",
      "+81",
      "+82",
      "+84",
      "+86",
      "+90",
      "+91",
      "+92",
      "+93",
      "+94",
      "+95",
      "+98",
      "+211",
      "+212",
      "+213",
      "+216",
      "+218",
      "+220",
      "+221",
      "+222",
      "+223",
      "+224",
      "+225",
      "+226",
      "+227",
      "+228",
      "+229",
      "+230",
      "+231",
      "+232",
      "+233",
      "+234",
      "+235",
      "+236",
      "+237",
      "+238",
      "+239",
      "+240",
      "+241",
      "+242",
      "+243",
      "+244",
      "+245",
      "+246",
      "+247",
      "+248",
      "+249",
      "+250",
      "+251",
      "+252",
      "+253",
      "+254",
      "+255",
      "+256",
      "+257",
      "+258",
      "+260",
      "+261",
      "+262",
      "+263",
      "+264",
      "+265",
      "+266",
      "+267",
      "+268",
      "+269",
      "+290",
      "+291",
    ];
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

  TextFormField inputField(TextEditingController controller, bool obscureText2,
      Size mediaquery, String hintText2, bool isHalfSized) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText2,
      validator: (value) =>
          nullEmptyValidation(value, "Please enter field data!"),
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        focusedBorder: borderRadius(),
        errorBorder: borderRadius(),
        focusedErrorBorder: borderRadius(),
        disabledBorder: borderRadius(),
        enabledBorder: borderRadius(),
        constraints: BoxConstraints(
          maxWidth: mediaquery.width * (isHalfSized ? 0.4 : 0.85),
        ),
        hintText: hintText2,
        fillColor: Colors.white,
      ),
    );
  }

  OutlineInputBorder borderRadius() {
    return OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(3));
  }

  Future<DateTime?> datePicker(BuildContext context) {
    final now = DateTime.now();
    return showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(1960),
        lastDate: now);
  }
}
