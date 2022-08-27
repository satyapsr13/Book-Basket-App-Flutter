// ignore_for_file: prefer_const_constructors
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nhsbpmonitor/Constants/enums.dart';
import 'package:nhsbpmonitor/Logic/Cubit/auth_cubit/auth_cubit.dart';
// import 'package:nhsbpmonitor/Presentation/Screens/Auth/signin/sign_in_with_username.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/gradient_screen_widget.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/primary_button.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/snackbar.dart';
import 'package:nhsbpmonitor/Routes/routes.gr.dart';
import 'package:nhsbpmonitor/constants/locations.dart';

class AccessCodeScreen extends StatefulWidget {
  const AccessCodeScreen({Key? key}) : super(key: key);

  @override
  State<AccessCodeScreen> createState() => _AccessCodeScreenState();
}

class _AccessCodeScreenState extends State<AccessCodeScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController accessCodeController = TextEditingController();

  bool rememberMe = true;
  Future<void> setAccessCode() async {
    // read access code from local database
    const secureStorage = FlutterSecureStorage();
    accessCodeController.text =
        await secureStorage.read(key: "ACCESS_CODE") ?? "";
    setState(() {});
  }

  @override
  void initState() {
    // if (!kReleaseMode) {
    //   accessCodeController.text = "FI78R";
    // }
    setAccessCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    final mediaquery = MediaQuery.of(context).size;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == Status.failure) {
          showSnackBar(context, Colors.red,
              state.message ?? "Login Error.Please try Again!");
        } else if (state.status == Status.success) {
          showSnackBar(context, Colors.green, "Successfully Login!");
          context.pushRoute(BPReading());
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
                      tr('signin'),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: mediaquery.height * 0.05),
                    Text(
                      tr('enter_code'),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: accessCodeController,
                      maxLength: 5,
                      textCapitalization: TextCapitalization.characters,
                      // inputFormatters: [FilteringTextInputFormatter.],
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Field can not be empty";
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
                            authCubit.loginUserWithAccessCode(
                                accessCodeController.text, rememberMe);
                          }
                        },
                        buttonText: tr("signin"),
                        isLoading: state.status == Status.loading,
                      );
                    }),



                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Checkbox(
                        side: BorderSide(color: Colors.white, width: 10),
                        activeColor: Color(0xff333333),
                        checkColor: Colors.white,
                        value: rememberMe,
                        onChanged: (val) {
                          setState(() {
                            rememberMe = val ?? rememberMe;
                          });
                        }),
                  ),
                  // const Spacer(),
                  Text(
                    tr("remember_me"),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextButton(
                      onPressed: () {
                        context.pushRoute(ForgotAccessCodeScreen());
                      },
                      child: Text(
                        tr('Forgot AccessCode'),
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     const Spacer(),
              //     Text(
              //       tr("Have a username and password ?"),
              //       style: TextStyle(
              //         fontSize: 12,
              //         color: Colors.white.withOpacity(0.7),
              //       ),
              //     ),
              //     TextButton(
              //       onPressed: () {
              //         context.pushRoute(
              //             // SignUpScreen(accessCode: accessCodeController.text));
              //             SignInWithUserName());
              //       },
              //       child: Text(
              //         tr("signin"),
              //         style: TextStyle(
              //             decoration: TextDecoration.underline,
              //             fontSize: 14,
              //             color: Colors.white,
              //             fontWeight: FontWeight.w600),
              //       ),
              //     ),
              //     const Spacer(),
              //   ],
              // ),
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
      enabledBorder: borderRadius(),
      constraints: BoxConstraints(
        maxWidth: mediaquery.width * 0.85,
      ),
      hintText: "*****",
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

  OutlineInputBorder borderRadius() {
    return OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(3));
  }
}
