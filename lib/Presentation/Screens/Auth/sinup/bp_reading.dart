// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, sort_child_properties_last
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nhsbpmonitor/Constants/enums.dart';
import 'package:nhsbpmonitor/Logic/Cubit/user_profile_cubit/user_profile_cubit.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/gradient_screen_widget.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/primary_button.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/snackbar.dart';
import 'package:nhsbpmonitor/Routes/routes.gr.dart';
import 'package:nhsbpmonitor/constants/locations.dart';

import 'package:auto_route/auto_route.dart';

class BPReading extends StatefulWidget {
  const BPReading({Key? key}) : super(key: key);

  @override
  State<BPReading> createState() => _BPReadingState();
}

class _BPReadingState extends State<BPReading> {
  TextEditingController systolicRatingController = TextEditingController();
  TextEditingController diastolicRatingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    UserProfileCubit userProfileCubit =
        BlocProvider.of<UserProfileCubit>(context);

    return BlocListener<UserProfileCubit, UserProfileState>(
      listener: (context, state) {
        if (state.status == Status.failure) {
          showSnackBar(context, Colors.red, "Please try again.");
        } else if (state.status == Status.bpAddedSucceess) {
           context.replaceRoute(SignalScreen(
              patientStatus: state.statusColor == "Green"
                  ? PatientStatus.healthy
                  : state.statusColor == "Red"
                      ? PatientStatus.danger
                      : PatientStatus.warning));
          showSnackBar(context, Colors.green, "Successfully Added.");

        }
      },
      child: GradientScreen(
        body: Form(
          key: _formKey,
          child: Column(
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
                          tr('add_BP_readings'),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            context.replaceRoute(HomeScreen());
                          },
                          child: Text(
                            'Skip',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: mediaquery.height * 0.03),
                    title("enter_systolic_ratings"),
                    inputField(systolicRatingController, mediaquery, "118"),
                    SizedBox(height: mediaquery.height * 0.03),
                    title("enter_diastolic_ratings"),
                    inputField(diastolicRatingController, mediaquery, "76"),
                    SizedBox(height: mediaquery.height * 0.03),
                    // title("enter_pulse"),
                    // inputField(
                    //   pulseRatingController,
                    //   mediaquery,
                    //   "52",
                    // ),
                    SizedBox(height: mediaquery.height * 0.15),
                    BlocBuilder<UserProfileCubit, UserProfileState>(
                      builder: (context, state) {
                        return PrimaryButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              userProfileCubit.addBPReading(
                                int.parse(systolicRatingController.text),
                                int.parse(diastolicRatingController.text),
                              );
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

  TextFormField inputField(
      TextEditingController controller, Size mediaquery, String hintText2) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3)
      ],
      validator: (val) {
        if (val!.isEmpty) {
          return tr("field_can_not_be_empty");
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
        constraints: BoxConstraints(
          maxWidth: mediaquery.width * (0.85),
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
}
