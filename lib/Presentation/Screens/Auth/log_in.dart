// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'dart:developer';

import 'package:book_basket/Constants/colors.dart';
import 'package:book_basket/Constants/locations.dart';
import 'package:book_basket/Data/services/google_sign_in.dart';
import 'package:book_basket/Presentation/Widgets/primary_button.dart';
import 'package:book_basket/Routes/routes.gr.dart';
import 'package:book_basket/Utility/common.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (kDebugMode) {
      emailController = TextEditingController(text: "satyapsr14@gmail.com");
      passwordController = TextEditingController(text: "123456");
    }
    super.initState();
  }

  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      persistentFooterButtons: [
        Column(
          children: [
            InkWell(
              onTap: () async {
                final userData = await GoogleSignInApi.login();
                if (userData != null) {
                  context.pushRoute(HomeScreen());
                }
                log("-------Login With Google ---------${userData.toString()}-------------------");
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: Color(0xff33556A),
                    )),
                width: mq.width * 0.7,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.google,
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Login with Google",
                      style: TextStyle(
                        fontSize: 15, color: Color(0xff33556A),

                        // color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account? ',
                  style: const TextStyle(
                    color: Color(0xff33556A),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.replaceRoute(SignUpScreen());
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Center(
              child: SizedBox(
                width: mq.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: mq.width * 0.8,
                      height: mq.height * 0.35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.onboarding_1),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 30, color: AppColors.primaryColor),
                    ),
                    // email textform field
                    SizedBox(height: 20),
                    Text(
                      'Enter Your details to excess the data',
                      style: const TextStyle(
                          fontSize: 14, color: Color(0xff415F8B)),
                    ),
                    SizedBox(height: 20),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: mq.width * 0.8,
                          child: TextFormField(
                            // key: _formKey,
                            controller: emailController,
                            validator: emailValidation,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle:
                                  const TextStyle(color: Color(0xff415F8B)),
                              border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff415F8B)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff415F8B)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff415F8B)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // password textform field
                        SizedBox(
                          width: mq.width * 0.8,
                          child: TextFormField(
                            // key: _formKey,
                            obscureText: !isPasswordVisible,
                            controller: passwordController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Field can not be empty';
                              }
                              // RegExp emailRegex = RegExp(
                              //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                              // if (!emailRegex.hasMatch(val)) {
                              //   return "Enter a valid email";
                              // }
                              return null;
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    isPasswordVisible == false
                                        ? Icons.visibility
                                        : Icons.visibility_off_outlined,
                                    size: 20,
                                    color: AppColors.primaryColor,
                                  )),
                              labelText: 'Password',
                              labelStyle:
                                  const TextStyle(color: Color(0xff415F8B)),
                              border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff415F8B)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff415F8B)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff415F8B)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        PrimaryButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.pushRoute(HomeScreen());
                            }
                          },
                          buttonText: "LOGIN",
                          widthSize: mq.width * 0.4,
                        ),
                        const SizedBox(height: 20),
                        // login with google
                        // google auth button
                        // Divider(
                        //   color: Colors.grey,
                        //   thickness: 1,
                        // ),
                        // const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}
