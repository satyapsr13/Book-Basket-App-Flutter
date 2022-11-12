// ignore_for_file: prefer_const_constructors
import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:book_basket/Constants/colors.dart';
import 'package:book_basket/Presentation/Widgets/primary_button.dart';
import 'package:book_basket/Routes/routes.gr.dart';
import 'package:book_basket/Utility/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpFormScreen extends StatefulWidget {
  @override
  State<SignUpFormScreen> createState() => _SignUpFormScreenState();
}

class _SignUpFormScreenState extends State<SignUpFormScreen> {
  // const SignUpFormScreen({Key? key}) : super(key: key);
  TextEditingController landMarkController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  // TextEditingController addressController = TextEditingController();

  TextEditingController pincodeController = TextEditingController();

  TextEditingController stateController = TextEditingController();

  TextEditingController mobileNumberController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (kDebugMode) {
      mobileNumberController.text = "1234567890";
      pincodeController.text = "123456";
      stateController.text = "MP";
      cityController.text = "Bhopal";
      landMarkController.text = " RGPV Hostel";
      nameController.text = " Book Basket";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('Sign up form'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  FittedBox(
                    child: Text(
                      'Fill the below details to buy/sell the books',
                      // textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  seperator(), seperator(),
                  heading("Name"),
                  // TextEditingController(),
                  seperator(),
                  TextFormField(
                    controller: nameController,
                    validator: nullValidation,
                    decoration: _inputDecoration(
                      "Enter your full name",
                    ),
                  ),

                  seperator(), seperator(),
                  heading("Mobile Number"),
                  // TextEditingController(),
                  seperator(),
                  TextFormField(
                      controller: mobileNumberController,
                      maxLength: 10,
                      validator: nullValidation,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter your mobile number",
                        prefixText: "+91 ",
                        hintStyle: const TextStyle(color: Color(0xff415F8B)),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff415F8B)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff415F8B)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff415F8B)),
                        ),
                      )),

                  // seperator(), seperator(),
                  // heading("Address"),
                  // // TextEditingController(),
                  // seperator(),
                  // TextFormField(
                  //   controller: addressController,
                  //   decoration: _inputDecoration(
                  //     "Enter your address",
                  //   ),
                  // ),

                  seperator(),
                  heading("Landmark"),
                  // TextEditingController(),
                  seperator(),
                  TextFormField(
                    controller: landMarkController,
                    validator: nullValidation,
                    decoration: _inputDecoration(
                      "Enter your landmark",
                    ),
                  ),

                  seperator(),
                  heading("City"),
                  // TextEditingController(),
                  seperator(),
                  TextFormField(
                    controller: cityController,
                    validator: nullValidation,
                    decoration: _inputDecoration(
                      "Enter your city",
                    ),
                  ),

                  seperator(),
                  heading("State"),
                  // TextEditingController(),
                  seperator(),
                  TextFormField(
                      readOnly: true,
                      controller: stateController,
                      validator: nullValidation,
                      onTap: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (_) => Column(
                                  // mainAxisSize: ,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                      child: SizedBox(
                                        width: mq.width * 0.8,
                                        height: mq.height * 0.4,
                                        // decoration: Bo,
                                        child: CupertinoPicker(
                                          backgroundColor: Colors.white,
                                          useMagnifier: true,
                                          itemExtent: 30,
                                          magnification: 1.1,
                                          scrollController:
                                              FixedExtentScrollController(
                                                  initialItem: 5),
                                          children: stateListWidget,
                                          onSelectedItemChanged: (value) {
                                            setState(() {
                                              stateController.text =
                                                  stateList[value];
                                              // boookEditionController.text = "";
                                              // boookEditionController.text =
                                              //     editionListString[value]
                                              //         .toString();
                                            });
                                            // Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                    ),
                                    //  SizedBox(height: mediaquery.height * 0.),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: PrimaryButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        buttonText: "Ok",
                                        widthSize: mq.width * 0.75,
                                      ),
                                    )
                                  ],
                                ));
                      },
                      decoration: InputDecoration(
                        // suffixIcon: DropdownButtonHideUnderline(
                        //   child: DropdownButton(
                        //     focusColor: Colors.white,
                        //     // value: _chosenValue,
                        //     //elevation: 5,
                        //     iconSize: 40,
                        //     style: const TextStyle(color: Colors.white),
                        //     //  const IconEnabledColor: Colors.black,
                        //     menuMaxHeight: 400,
                        //     items: stateList
                        //         .map<DropdownMenuItem<String>>((String value) {
                        //       return DropdownMenuItem<String>(
                        //         value: value,
                        //         child: Text(
                        //           value,
                        //           style: const TextStyle(color: Colors.black),
                        //         ),
                        //       );
                        //     }).toList(),
                        //     // hint: Text(
                        //     //   "PO no List",
                        //     //   style: const TextStyle(
                        //     //       color: Colors.black,
                        //     //       fontSize: 14,
                        //     //       fontWeight: FontWeight.w500),
                        //     // ),
                        //     onChanged: (value) {
                        //       setState(() {
                        //         // _chosenValue = value;
                        //         stateController.text = value.toString();
                        //       });
                        //     },
                        //   ),
                        // ),

                        hintText: "Enter your state",
                        hintStyle: const TextStyle(color: Color(0xff415F8B)),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff415F8B)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff415F8B)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff415F8B)),
                        ),
                      )),

                  seperator(),
                  heading("Pincode"),
                  seperator(),
                  TextFormField(
                    controller: pincodeController,
                    maxLength: 6,
                    validator: nullValidation,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: _inputDecoration(
                      "Enter your pincode",
                    ),
                  ),
                  seperator(), seperator(),
                  PrimaryButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          AwesomeDialog(
                            showCloseIcon: true,
                            dismissOnTouchOutside: false,
                            context: context,
                            dialogType: DialogType.question,
                            animType: AnimType.topSlide,
                            title: 'All details are correct?',
                            // desc: 'Dialog description here.............',
                            btnOkText: "Submit",
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                              context.pushRoute(HomeScreen());
                            },
                          ).show();
                        }
                      },
                      buttonText: "Submit"),
                  seperator(), seperator(),
                ],
              ),
            ),
          ),
        ),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }

  List<String> get stateList {
    return <String>[
      'Andhra Pradesh',
      'Arunachal Pradesh',
      'Assam',
      'Bihar',
      'Chhattisgarh',
      'Goa',
      'Gujarat',
      'Haryana',
      'Himachal Pradesh',
      'Jharkhand',
      'Karnataka',
      'Kerala',
      'Madhya Pradesh',
      'Maharashtra',
      'Manipur',
      'Meghalaya',
      'Mizoram',
      'Nagaland',
      'Odisha',
      'Punjab',
      'Rajasthan',
      'Sikkim',
      'Tamil Nadu',
      'Telangana',
      'Tripura',
      'Uttarakhand',
      'Uttar Pradesh',
      'West Bengal',
      'Andaman and Nicobar'
    ];
  }

  List<Widget> get stateListWidget {
    return <Widget>[
      Text(
        'Andhra Pradesh',
      ),
      Text(
        'Arunachal Pradesh',
      ),
      Text(
        'Assam',
      ),
      Text(
        'Bihar',
      ),
      Text(
        'Chhattisgarh',
      ),
      Text(
        'Goa',
      ),
      Text(
        'Gujarat',
      ),
      Text(
        'Haryana',
      ),
      Text(
        'Himachal Pradesh',
      ),
      Text(
        'Jharkhand',
      ),
      Text(
        'Karnataka',
      ),
      Text(
        'Kerala',
      ),
      Text(
        'Madhya Pradesh',
      ),
      Text(
        'Maharashtra',
      ),
      Text(
        'Manipur',
      ),
      Text(
        'Meghalaya',
      ),
      Text(
        'Mizoram',
      ),
      Text(
        'Nagaland',
      ),
      Text(
        'Odisha',
      ),
      Text(
        'Punjab',
      ),
      Text(
        'Rajasthan',
      ),
      Text(
        'Sikkim',
      ),
      Text(
        'Tamil Nadu',
      ),
      Text(
        'Telangana',
      ),
      Text(
        'Tripura',
      ),
      Text(
        'Uttarakhand',
      ),
      Text(
        'Uttar Pradesh',
      ),
      Text(
        'West Bengal',
      ),
      Text('Andaman and Nicobar'),
    ];
  }

  SizedBox seperator() => const SizedBox(height: 20);

  InputDecoration _inputDecoration(String labelText2) {
    return InputDecoration(
      hintText: labelText2,
      hintStyle: const TextStyle(color: Color(0xff415F8B)),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff415F8B)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff415F8B)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff415F8B)),
      ),
    );
  }

  Text heading(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, color: Color(0xff839FC0)),
    );
  }
}
