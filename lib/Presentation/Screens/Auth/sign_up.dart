// ignore_for_file: prefer_const_constructors
import 'package:book_basket/Constants/colors.dart';
import 'package:book_basket/Constants/locations.dart';
import 'package:book_basket/Presentation/Widgets/primary_button.dart';
import 'package:book_basket/Routes/routes.gr.dart';
import 'package:book_basket/Utility/common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    if (kDebugMode) {
      emailController = TextEditingController(text: "satyapsr14@gmail.com");
      passwordController = TextEditingController(text: "123456");
      confirmPasswordController = TextEditingController(text: "123457");
    }
    super.initState();
  }

  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: mq.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   width: mq.width * 0.8,
                //   height: mq.height * 0.3,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage(AppImages.onboarding_1),
                //       fit: BoxFit.contain,
                //     ),
                //   ),
                // ),
                SizedBox(height: mq.height * 0.15),
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 30, color: AppColors.primaryColor),
                ),
                // email textform field
                SizedBox(height: 20),
                Text(
                  'Enter Your details to excess the data',
                  style:
                      const TextStyle(fontSize: 14, color: Color(0xff415F8B)),
                ),
                SizedBox(height: 20),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: mq.width * 0.8,
                      child: TextFormField(
                        controller: emailController,
                        validator: emailValidation,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Color(0xff415F8B)),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff415F8B)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff415F8B)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff415F8B)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // password textform field
                    SizedBox(
                      width: mq.width * 0.8,
                      child: TextFormField(
                        obscureText: !isPasswordVisible,
                        controller: passwordController,
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
                              )),
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Color(0xff415F8B)),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff415F8B)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff415F8B)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff415F8B)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // password textform field
                    SizedBox(
                      width: mq.width * 0.8,
                      child: TextFormField(
                        obscureText: !isPasswordVisible,
                        controller: confirmPasswordController,
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
                              )),
                          labelText: 'Confirm Password',
                          labelStyle: const TextStyle(color: Color(0xff415F8B)),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff415F8B)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff415F8B)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff415F8B)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      onPressed: () {
                        context.pushRoute(HomeScreen());
                      },
                      buttonText: "Sign up",
                      widthSize: mq.width * 0.4,
                    ),
                    const SizedBox(height: 20),
                    // login with google
                    // google auth button
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: mq.width * 0.7,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.carousel_1,
                              width: 20,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Sign with Google",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xffE74C3C),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Have an account? ',
                          style: const TextStyle(
                            color: Color(0xff33556A),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.replaceRoute(LoginScreen());
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}
