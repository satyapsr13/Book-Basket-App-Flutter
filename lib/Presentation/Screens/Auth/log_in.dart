// ignore_for_file: prefer_const_constructors
import 'package:book_basket/Constants/colors.dart';
import 'package:book_basket/Presentation/Widgets/primary_button.dart';
import 'package:book_basket/Routes/routes.gr.dart';
import 'package:book_basket/Utility/common.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: mq.width * 0.8,
            height: mq.height * 0.35,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            'Enter Your details to excess the data',
            style: const TextStyle(fontSize: 14, color: Color(0xff415F8B)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: TextStyle(fontSize: 30, color: AppColors.primaryColor),
              ),
              // email textform field
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
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    suffix: IconButton(
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
              PrimaryButton(
                onPressed: () {},
                buttonText: "Login",
                widthSize: mq.width * 0.5,
              ),
              const SizedBox(height: 20),
              // login with google
              PrimaryButton(
                onPressed: () {},
                buttonText: "Login with Google",
                // widthSize: mq.width * 0.5,
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
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}
