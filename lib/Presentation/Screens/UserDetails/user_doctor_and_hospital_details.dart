// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nhsbpmonitor/Constants/enums.dart';
import 'package:nhsbpmonitor/Constants/locations.dart';
import 'package:nhsbpmonitor/Logic/Cubit/user_profile_cubit/user_profile_cubit.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/drawer.dart';
import 'package:nhsbpmonitor/Routes/routes.gr.dart';
import 'package:nhsbpmonitor/Utility/common.dart';

class UserDoctorAndHospitalScreen extends StatefulWidget {
  const UserDoctorAndHospitalScreen({Key? key}) : super(key: key);
  @override
  State<UserDoctorAndHospitalScreen> createState() =>
      _UserDoctorAndHospitalScreenState();
}

class _UserDoctorAndHospitalScreenState
    extends State<UserDoctorAndHospitalScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  //------------------------------------
  @override
  void initState() {
    BlocProvider.of<UserProfileCubit>(context)
        .fetchUsersDoctorAndHospitalDetails();

    super.initState();
  }

  PatientStatus patientStatus = PatientStatus.healthy;

  // int _activeNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF0F4F6),
        key: _scaffoldKey,
        endDrawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: BlocBuilder<UserProfileCubit, UserProfileState>(
            builder: (context, state) {
              if (state.status == Status.loading) {
                return circulatProgressIndicator(mediaquery);
              }
              if (state.status == Status.failure) {
                return SizedBox(
                  height: mediaquery.height,
                  width: mediaquery.width,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${state.error}! Please login.",
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // context.router.root.push(const OnBoardingScreen());
                            context.replaceRoute(const OnBoardingScreen());
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return Column(children: [
                Container(
                  width: mediaquery.width,
                  height: 70,
                  color: Colors.white,
                  child: Row(
                    children: [
                      _logoImage(),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          context.pushRoute(const RemindersScreen());
                        },
                        child: _bellIcon(),
                      ),
                      InkWell(
                        onTap: () {
                          _scaffoldKey.currentState!.openEndDrawer();
                        },
                        child: _menuIcon(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                      height: mediaquery.width * 0.4,
                      width: mediaquery.width * 0.4,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://pikwizard.com/photos/doctors-and-surgeon-standing-together-in-hospital--65f20168c02da9d8acada2e0cdc06eb0-l.jpg",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                              Color(0xfff2f2f2), BlendMode.color),
                          child: Image.asset(
                            'assets/images/logo.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // CircleAvatar(
                //   minRadius: mediaquery.width * 0.25,
                //   backgroundImage: const NetworkImage(
                //       'https://pikwizard.com/photos/doctors-and-surgeon-standing-together-in-hospital--65f20168c02da9d8acada2e0cdc06eb0-l.jpg'),
                // ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // Row(
                      //   children: [
                      //     const Text(
                      //       'Doctor ID:- ',
                      //       style: TextStyle(
                      //         fontSize: 20,
                      //       ),
                      //     ),
                      //     Text(
                      //       "${state.userDoctorDetails!.doctorId} ",
                      //       style: const TextStyle(
                      //         fontSize: 20,
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Text(
                            'Name:- ',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "${state.userDoctorDetails!.doctorFirstName} ${state.userDoctorDetails!.doctorLastName}",
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Text(
                            'Phone Number:- ',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "${state.userDoctorDetails!.doctorMobileNumber}  ",
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Text(
                            'Hospital Name:- ',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "${state.userDoctorDetails!.hospitalName}  ",
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Text(
                            'Hospital Number:- ',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "${state.userDoctorDetails!.hospitalNumber}  ",
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ]);
            },
          ),
        ),
      ),
    );
  }

  Widget circulatProgressIndicator(Size mediaquery) {
    return SizedBox(
        height: mediaquery.height,
        width: mediaquery.width,
        child: const Center(
            child: CircularProgressIndicator(
          color: Color(0xff23A6B1),
        )));
  }

  Padding _bellIcon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        AssetIcons.bell,
        height: 21,
        width: 20,
        color: const Color(0xffFF9333),
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
}
