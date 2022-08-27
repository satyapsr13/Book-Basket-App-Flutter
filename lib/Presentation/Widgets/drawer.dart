import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nhsbpmonitor/Constants/locations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nhsbpmonitor/Data/services/secure_storage.dart';
import 'package:nhsbpmonitor/Logic/Cubit/user_profile_cubit/user_profile_cubit.dart';
// import 'package:nhsbpmonitor/Presentation/Screens/UserDetails/pregnancy_details.dart';

import 'package:nhsbpmonitor/Routes/routes.gr.dart';

// import 'package:nhsbpmonitor/constants/locations.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawer2State createState() => _MyDrawer2State();
}

class _MyDrawer2State extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    return Drawer(
      child: Container(
        height: mediaquery.height - 20,
        decoration: const BoxDecoration(
          color: Color(0xff23A6B1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                cancelButton(context),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 10,
                    ),
                    BlocBuilder<UserProfileCubit, UserProfileState>(
                      builder: (context, state) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${state.userData?.patientUserData?.firstName} ${state.userData?.patientUserData?.lastName}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            // Text(
                            //   'ID:- ${state.userData?.patientUserData?.id}',
                            //   style: TextStyle(
                            //     color: Colors.white.withOpacity(0.8),
                            //     fontSize: 12,
                            //     // fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // const SizedBox(height: 5),
                            // profile edit button

                            // InkWell(
                            //   onTap: () {
                            //     context.replaceRoute(
                            //         const PersonalDetailsScreen());
                            //   },
                            //   child: Text(
                            //     tr('view_and_edit_profile'),
                            //     style: TextStyle(
                            //         decoration: TextDecoration.underline,
                            //         color: Colors.white.withOpacity(0.8),
                            //         fontSize: 12),
                            //   ),
                            // ),
                          ],
                        );
                      },
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.grey,
                      minRadius: 25,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Divider(
                  color: Colors.white.withOpacity(0.1),
                  thickness: 1,
                ),
                const SizedBox(height: 20),
                DrawerButton(
                    ontap: () {
                      Navigator.pop(context);
                      context.replaceRoute(const HomeScreen());
                    },
                    title: "home"),
                const SizedBox(height: 20),
                // DrawerButton(
                //     ontap: () {
                //       context.pushRoute(const SignalScreen());
                //     },
                //     title: "my_appoinments"),
                // const SizedBox(height: 20),
                DrawerButton(
                    ontap: () {
                      Navigator.pop(context);
                      // close end drawer

                      context.pushRoute(const UserDoctorAndHospitalScreen());
                    },
                    title: "my_hospital_doctor"),
                const SizedBox(height: 20),
                // DrawerButton(
                //     ontap: () {
                //       context.pushRoute(const PregnancyDetails());
                //     },
                //     title: "pregnancy_details"),
                // const SizedBox(height: 20),
                // DrawerButton(
                //     ontap: () {
                //       context.pushRoute(const PersonalDetailsScreen());
                //     },
                //     title: "personal_details"),
                // const SizedBox(height: 20),

                // Settings menu item
                // DrawerButton(
                //     ontap: () {
                //       // context.pushRoute(const AccessCodeScreen());
                //     },
                //     isDisabled: true,
                //     title: "settings"),
                // const SizedBox(height: 20),
                DrawerButton(
                    ontap: () {
                      Navigator.pop(context);
                      context.pushRoute(const RemindersScreen());
                    },
                    title: "reminders"),
                const SizedBox(height: 20),
                DrawerButton(
                    ontap: () {
                      final storage = SecureStorage();
                      storage.deleteAll();
                      context.replaceRoute(const OnBoardingScreen());
                      // context.replaceRouteonst OnBoardingScreen());
                    },
                    title: "logout"),
                // const Expanded(child: SizedBox()),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell cancelButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: SvgPicture.asset(
        AssetIcons.cancel,
        height: 25,
        width: 25,
        color: Colors.white,
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    Key? key,
    required this.ontap,
    required this.title,
    this.isDisabled = false,
  }) : super(key: key);

  final void Function()? ontap;
  final String title;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        onPressed: !isDisabled ? ontap : () {},
        child: Text(
          tr(title),
          textAlign: TextAlign.right,
          style: TextStyle(
            color: isDisabled ? Colors.black45 : Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
