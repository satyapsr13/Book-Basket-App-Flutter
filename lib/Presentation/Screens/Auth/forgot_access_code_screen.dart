// ignore_for_file: prefer_const_constructors
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
import 'package:nhsbpmonitor/constants/locations.dart';

class ForgotAccessCodeScreen extends StatefulWidget {
  const ForgotAccessCodeScreen({Key? key}) : super(key: key);

  @override
  State<ForgotAccessCodeScreen> createState() => _ForgotAccessCodeScreenState();
}

class _ForgotAccessCodeScreenState extends State<ForgotAccessCodeScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();
  // String countryCode = "+61";
  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    final mediaquery = MediaQuery.of(context).size;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == Status.failure) {
          showSnackBar(
            context,
            Colors.red,
            "Please enter valid mobile number or check with hospital for updating mobile number",
          );
        } else if (state.status == Status.forgotAccesscodeSuccess) {
          // show dialogue box

          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("AccessCode"),
                  content: Row(
                    children: [
                      Text(state.accessCode),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Clipboard.setData(
                                ClipboardData(text: state.accessCode));
                            showSnackBar(context, Colors.green,
                                "AccessCode Copied to Clipboard");
                          },
                          icon: const Icon(
                            Icons.content_copy,
                            size: 20,
                          )),
                    ],
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xffFF9333),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.all(14),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        context.replaceRoute(AccessCodeScreen());
                      },
                      child: Text(tr("signin")),
                    )
                  ],
                );
              });
        }
      },
      child: GradientScreen(
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _whiteLogoImage(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: mediaquery.height * 0.05),
                    Text(
                      tr('Forgot AccessCode'),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: mediaquery.height * 0.05),
                    TextFormField(
                      controller: phoneNumberController,
                      maxLength: 10,
                      // keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.characters,
                      // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Field can not be empty";
                        }

                        if (val[0] != '+') {
                          return "Invalid country code it should start with +";
                        }
                        if (val.contains(RegExp(r'[A-Z][a-z]'))) {
                          return "Invalid phone number";
                        }


                        return null;
                      },
                      decoration: _inputDecoration(mediaquery),
                    ),
                    SizedBox(height: mediaquery.height * 0.25),
                    BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                      return PrimaryButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            authCubit.forgotAccessCode(
                                // countryCode + phoneNumberController.text);
                                phoneNumberController.text);
                          }
                        },
                        buttonText: tr("get_access_code"),
                        isLoading: state.status == Status.loading,
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(Size mediaquery) {
    return InputDecoration(
      border: InputBorder.none,
      filled: true,
      focusedBorder: borderRadius(),
      errorBorder: borderRadius(),
      focusedErrorBorder: borderRadius(),
      disabledBorder: borderRadius(),
      // prefixIcon: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 10),
      //   child: Container(
      //     color: Colors.transparent,
      //     child: DropdownButtonHideUnderline(
      //       child: DropdownButton(
      //         focusColor: Colors.white,
      //         style: TextStyle(color: Colors.white),
      //         items: _countryCodeList
      //             .map<DropdownMenuItem<String>>((String value) {
      //           return DropdownMenuItem<String>(
      //             value: value,
      //             child: Text(
      //               value,
      //               style: const TextStyle(color: Colors.black),
      //             ),
      //           );
      //         }).toList(),
      //         hint: Text(
      //           countryCode,
      //           style: const TextStyle(
      //               color: Colors.black,
      //               fontSize: 14,
      //               fontWeight: FontWeight.w500),
      //         ),
      //         onChanged: (value) {
      //           setState(() {
      //             countryCode = value.toString();
      //           });
      //         },
      //       ),
      //     ),
      //   ),
      // ),

      enabledBorder: borderRadius(),
      constraints: BoxConstraints(
        maxWidth: mediaquery.width * 0.85,
      ),
      // hintText: "",
      hintText: " Mobile Number",
      fillColor: Colors.white,
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

  OutlineInputBorder borderRadius() {
    return OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(3));
  }
}
