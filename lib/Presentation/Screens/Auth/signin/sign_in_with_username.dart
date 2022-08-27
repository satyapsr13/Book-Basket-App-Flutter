// ignore_for_file: prefer_const_constructors
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nhsbpmonitor/Constants/enums.dart';
import 'package:nhsbpmonitor/Logic/Cubit/auth_cubit/auth_cubit.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/gradient_screen_widget.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/primary_button.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/snackbar.dart';
import 'package:nhsbpmonitor/Routes/routes.gr.dart';
import 'package:nhsbpmonitor/Utility/common.dart';
import 'package:nhsbpmonitor/constants/locations.dart';
import 'package:auto_route/auto_route.dart';

class SignInWithUserName extends StatefulWidget {
  const SignInWithUserName({Key? key}) : super(key: key);

  @override
  State<SignInWithUserName> createState() => _SignInWithUserNameState();
}

class _SignInWithUserNameState extends State<SignInWithUserName> {
  bool rememberMe = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

// for testing purpose only in debug mode


  @override
  void initState() {
    if (!kReleaseMode) {
      userNameController.text = "testPat001";
      passwordController.text = "Accesscode@123";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return GradientScreen(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == Status.failure) {
            showSnackBar(context, Colors.red,
                state.message ?? "Login Error. Try Again!");
          } else if (state.status == Status.success) {
            showSnackBar(context, Colors.green, "Successfully Login!");
            context.pushRoute(BPReading());
          }
        },
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AssetImages.whiteLogo,
                height: 150,
                width: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
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
                      tr('user_name'),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    inputField(
                        userNameController, false, mediaquery, "Lorem Epsum"),
                    const SizedBox(height: 20),
                    Text(
                      tr('password'),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    inputField(passwordController, true, mediaquery, ""),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              side: BorderSide(color: Colors.white, width: 10),
                              activeColor: Color(0xff333333),
                              checkColor: Colors.white,
                              value: rememberMe,
                              onChanged: (val) {
                                setState(() {
                                  rememberMe = val ?? rememberMe;
                                });
                              }),
                          // const Spacer(),
                          Text(
                            tr("remember_me"),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              tr('forgot_password?'),
                              style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: mediaquery.height * 0.08),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return PrimaryButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              authCubit.loginUser(userNameController.text,
                                  passwordController.text);
                            }
                          },
                          buttonText: tr("signin"),
                          isLoading: state.status == Status.loading,
                        );
                      },
                    ),
                  ],
                ),
              ),
              // for signUP
              // Row(
              //   children: [
              //     const Spacer(),
              //     Text(
              //       'Don’t have an account?',
              //       style: TextStyle(
              //         fontSize: 12,
              //         color: Colors.white.withOpacity(0.7),
              //       ),
              //     ),
              //     TextButton(
              //       onPressed: () {
              //         context.pushRoute(SignUpScreen());
              //       },
              //       child: Text(
              //         tr("signup"),
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

  TextFormField inputField(TextEditingController userNameController,
      bool obscureText2, Size mediaquery, String hintText2) {
    return TextFormField(
      controller: userNameController,
      obscureText: obscureText2,
      validator: (value) => nullEmptyValidation(value, "Please enter field!"),
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        errorBorder: borderRadius(),
        focusedBorder: borderRadius(),
        focusedErrorBorder: borderRadius(),
        disabledBorder: borderRadius(),
        enabledBorder: borderRadius(),
        constraints: BoxConstraints(maxWidth: mediaquery.width * 0.85),
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
