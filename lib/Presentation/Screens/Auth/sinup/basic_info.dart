import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/gradient_screen_widget.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/primary_button.dart';
import 'package:nhsbpmonitor/Routes/routes.gr.dart';
import 'package:nhsbpmonitor/Utility/common.dart';
import 'package:nhsbpmonitor/constants/locations.dart';

class BasicInfo extends StatefulWidget {
  const BasicInfo({Key? key}) : super(key: key);

  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  // TextEditingController passwordController = TextEditingController();

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  DateTime birthDate = DateTime.now();
  bool isVisible = true;
  String bloodGroup = "O+";
  // num weight = 60;
  // num height = 166.1;
  // final List<double> weightList = [
  //   40,
  //   40.5,
  //   41,
  //   41.5,
  //   42,
  //   42.5,
  //   43,
  //   43.5,
  //   44,
  //   44.5,
  //   45,
  //   45.5,
  //   46,
  //   46.5,
  //   47,
  //   47.5,
  //   48,
  //   48.5,
  //   49,
  //   49.5,
  //   50,
  //   50.5,
  //   51,
  //   51.5,
  //   52,
  //   52.5,
  //   53,
  //   53.5,
  //   54,
  //   54.5,
  //   55,
  //   55.5,
  //   56,
  //   56.5,
  //   57,
  //   57.5,
  //   58,
  //   58.5,
  //   59,
  //   59.5,
  //   60,
  //   60.5,
  //   61,
  //   61.5,
  //   62,
  //   62.5,
  //   63,
  //   63.5,
  //   64,
  //   64.5,
  //   65,
  //   65.5,
  //   66,
  //   66.5,
  //   67,
  //   67.5,
  //   68,
  //   68.5,
  //   69,
  //   69.5,
  //   70,
  //   70.5,
  //   71,
  //   71.5,
  //   72,
  //   72.5,
  //   73,
  //   73.5,
  //   74,
  //   74.5,
  //   75,
  //   75.5,
  //   76,
  //   76.5,
  //   77,
  //   77.5,
  //   78,
  //   78.5,
  //   79,
  //   79.5,
  //   80,
  //   80.5,
  //   81,
  //   81.5,
  //   82,
  //   82.5,
  //   83,
  //   83.5,
  //   84,
  //   84.5,
  //   85,
  //   85.5,
  //   86,
  //   86.5,
  //   87,
  //   87.5,
  //   88,
  //   88.5,
  //   89,
  //   89.5,
  //   90,
  //   90.5,
  //   91,
  //   91.5,
  //   92,
  //   92.5,
  //   93,
  //   93.5,
  //   94,
  //   94.5,
  //   95,
  //   95.5,
  //   96,
  //   96.5,
  //   97,
  //   97.5,
  //   98,
  //   98.5,
  //   99,
  //   99.5,
  //   100,
  //   100.5,
  //   101,
  //   101.5,
  //   102,
  //   102.5,
  //   103,
  //   103.5,
  //   104,
  //   104.5,
  //   105,
  //   105.5,
  //   106,
  //   106.5,
  //   107,
  //   107.5,
  //   108,
  //   108.5,
  //   109,
  //   109.5,
  //   110,
  //   110.5,
  //   111,
  //   111.5,
  //   112,
  //   112.5,
  //   113,
  //   113.5,
  //   114,
  //   114.5,
  //   115,
  //   115.5,
  //   116,
  //   116.5,
  //   117,
  //   117.5,
  //   118,
  //   118.5,
  //   119,
  //   119.5,
  //   120,
  //   120.5,
  //   121,
  //   121.5,
  //   122,
  //   122.5,
  //   123,
  //   123.5,
  //   124,
  //   124.5,
  //   125,
  //   125.5,
  //   126,
  //   126.5,
  //   127,
  //   127.5,
  //   128,
  //   128.5,
  //   129,
  //   129.5,
  //   130,
  //   130.5,
  //   131,
  //   131.5,
  //   132,
  //   132.5,
  //   133,
  //   133.5,
  //   134,
  //   134.5,
  //   135,
  //   135.5,
  //   136,
  //   136.5,
  //   137,
  //   137.5,
  //   138,
  //   138.5,
  //   139,
  //   139.5,
  //   140,
  //   140.5,
  //   141,
  //   141.5
  // ];

  // final List<double> heightList = [
  //   92,
  //   92.5,
  //   93,
  //   93.5,
  //   94,
  //   94.5,
  //   95,
  //   95.5,
  //   96,
  //   96.5,
  //   97,
  //   97.5,
  //   98,
  //   98.5,
  //   99,
  //   99.5,
  //   100,
  //   100.5,
  //   101,
  //   101.5,
  //   102,
  //   102.5,
  //   103,
  //   103.5,
  //   104,
  //   104.5,
  //   105,
  //   105.5,
  //   106,
  //   106.5,
  //   107,
  //   107.5,
  //   108,
  //   108.5,
  //   109,
  //   109.5,
  //   110,
  //   110.5,
  //   111,
  //   111.5,
  //   112,
  //   112.5,
  //   113,
  //   113.5,
  //   114,
  //   114.5,
  //   115,
  //   115.5,
  //   116,
  //   116.5,
  //   117,
  //   117.5,
  //   118,
  //   118.5,
  //   119,
  //   119.5,
  //   120,
  //   120.5,
  //   121,
  //   121.5,
  //   122,
  //   122.5,
  //   123,
  //   123.5,
  //   124,
  //   124.5,
  //   125,
  //   125.5,
  //   126,
  //   126.5,
  //   127,
  //   127.5,
  //   128,
  //   128.5,
  //   129,
  //   129.5,
  //   130,
  //   130.5,
  //   131,
  //   131.5,
  //   132,
  //   132.5,
  //   133,
  //   133.5,
  //   134,
  //   134.5,
  //   135,
  //   135.5,
  //   136,
  //   136.5,
  //   137,
  //   137.5,
  //   138,
  //   138.5,
  //   139,
  //   139.5,
  //   140,
  //   140.5,
  //   141,
  //   141.5,
  //   142,
  //   142.5,
  //   143,
  //   143.5,
  //   144,
  //   144.5,
  //   145,
  //   145.5,
  //   146,
  //   146.5,
  //   147,
  //   147.5,
  //   148,
  //   148.5,
  //   149,
  //   149.5,
  //   150,
  //   150.5,
  //   151,
  //   151.5,
  //   152,
  //   152.5,
  //   153,
  //   153.5,
  //   154,
  //   154.5,
  //   155,
  //   155.5,
  //   156,
  //   156.5,
  //   157,
  //   157.5,
  //   158,
  //   158.5,
  //   159,
  //   159.5,
  //   160,
  //   160.5,
  //   161,
  //   161.5,
  //   162,
  //   162.5,
  //   163,
  //   163.5,
  //   164,
  //   164.5,
  //   165,
  //   165.5,
  //   166,
  //   166.5,
  //   167,
  //   167.5,
  //   168,
  //   168.5,
  //   169,
  //   169.5,
  //   170,
  //   170.5,
  //   171,
  //   171.5,
  //   172,
  //   172.5,
  //   173,
  //   173.5,
  //   174,
  //   174.5,
  //   175,
  //   175.5,
  //   176,
  //   176.5,
  //   177,
  //   177.5,
  //   178,
  //   178.5,
  //   179,
  //   179.5,
  //   180,
  //   180.5,
  //   181,
  //   181.5,
  //   182,
  //   182.5,
  //   183,
  //   183.5,
  //   184,
  //   184.5,
  //   185,
  //   185.5,
  //   186,
  //   186.5,
  //   187,
  //   187.5,
  //   188,
  //   188.5,
  //   189,
  //   189.5,
  //   190,
  //   190.5,
  //   191,
  //   191.5,
  //   192,
  //   192.5,
  //   193,
  //   193.5,
  //   194,
  //   194.5,
  //   195,
  //   195.5,
  //   196,
  //   196.5,
  //   197,
  //   197.5,
  //   198,
  //   198.5,
  //   199,
  //   199.5,
  //   200,
  //   200.5,
  //   201,
  //   201.5,
  //   202,
  //   202.5,
  //   203,
  //   203.5,
  //   204,
  //   204.5,
  //   205,
  //   205.5,
  //   206,
  //   206.5,
  //   207,
  //   207.5,
  //   208,
  //   208.5,
  //   209,
  //   209.5,
  //   210,
  //   210.5,
  //   211,
  //   211.5,
  //   212,
  //   212.5,
  //   213,
  //   213.5,
  //   214,
  //   214.5,
  //   215,
  //   215.5,
  //   216,
  //   216.5,
  //   217,
  //   217.5,
  //   218,
  //   218.5,
  //   219,
  //   219.5,
  //   220,
  //   220.5,
  //   221,
  //   221.5,
  //   222,
  //   222.5,
  //   223,
  //   223.5,
  //   224,
  //   224.5,
  //   225,
  //   225.5,
  //   226,
  //   226.5,
  //   227,
  //   227.5,
  //   228,
  //   228.5,
  //   229,
  //   229.5,
  //   230,
  //   230.5,
  //   231,
  //   231.5,
  //   232,
  //   232.5,
  //   233,
  //   233.5,
  //   234,
  //   234.5,
  //   235,
  //   235.5,
  //   236,
  //   236.5,
  //   237,
  //   237.5,
  //   238,
  //   238.5,
  //   239,
  //   239.5,
  //   240,
  //   240.5,
  // ];

  num bmi = 1;
  String weightStatus = "0";
  final bloodGroupList = [
    "AB-",
    "O-",
    "B-",
    "A-",
    "B+",
    "A+",
    "AB+",
    "O+",
  ];
  // void calculateBMI() {
  //   setState(() {
  //     bmi = weight / (height * height / 10000);

  //     // weightStatus = "Overweight";
  //     weightStatus = double.parse(bmi.toStringAsFixed(2)).toString();
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return GradientScreen(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: mediaquery.height * 0.03),
                  Row(
                    children: [
                      _backButton(context),
                      Text(
                        tr('basic_info'),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: mediaquery.height * 0.03),
                  title("weight"),
                  TextFormField(
                    keyboardType: const TextInputType.numberWithOptions(
                      signed: false,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    controller: weightController,
                    validator: (value) => nullEmptyValidation(
                        value, tr("field_can_not_be_empty")),
                    decoration: InputDecoration(
                      suffixText: "Pounds",
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
                      hintText: "weight",
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  title("height"),
                  // Container(
                  //   width: mediaquery.width * 0.4,
                  //   decoration: _boxDecoration(),
                  //   child: DropdownButton(
                  //     focusColor: Colors.white,
                  //     underline: const Text(''),
                  //     isExpanded: true,
                  //     style: const TextStyle(color: Colors.white),
                  //     items: heightList
                  //         .map<DropdownMenuItem<double>>((double value) {
                  //       return DropdownMenuItem<double>(
                  //         value: value,
                  //         child: Text(
                  //           value.toString(),
                  //           style: const TextStyle(color: Colors.black),
                  //         ),
                  //       );
                  //     }).toList(),
                  //     hint: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Text(
                  //         "$height CM",
                  //         style: const TextStyle(
                  //             color: Colors.black,
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.w500),
                  //       ),
                  //     ),
                  //     onChanged: (value) {
                  //       setState(() {
                  //         height = num.parse(value.toString());
                  //       });
                  //       calculateBMI();
                  //     },
                  //   ),
                  // ),

                  TextFormField(
                    keyboardType: const TextInputType.numberWithOptions(
                      signed: false,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),

                      // WhitelistingTextInputFormatter(
                    ],
                    controller: heightController,
                    validator: (value) => nullEmptyValidation(
                        value, tr("field_can_not_be_empty")),
                    decoration: InputDecoration(
                      suffixText: "Feet / inches",
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
                      hintText: "height",
                      fillColor: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title("blood_group"),
                          Container(
                            width: mediaquery.width * 0.4,
                            decoration: _boxDecoration(),
                            child: DropdownButton(
                              focusColor: Colors.white,
                              underline: const Text(''),
                              isExpanded: true,
                              style: const TextStyle(color: Colors.white),
                              items: bloodGroupList
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              hint: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  bloodGroup,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  bloodGroup = value.toString();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title("bmi"),
                          Container(
                            width: mediaquery.width * 0.4,
                            height: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xff278D96),
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Center(
                              child: Text(
                                weightStatus,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [],
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: mediaquery.height * 0.05),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      tr("location"),
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title("state"),
                          TextFormField(
                            keyboardType: TextInputType.streetAddress,
                            controller: stateController,
                            validator: (value) => nullEmptyValidation(
                                value, tr("field_can_not_be_empty")),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              focusedBorder: borderRadius(),
                              errorBorder: borderRadius(),
                              focusedErrorBorder: borderRadius(),
                              disabledBorder: borderRadius(),
                              enabledBorder: borderRadius(),
                              constraints: BoxConstraints(
                                maxWidth: mediaquery.width * 0.4,
                              ),
                              hintText: "lorem",
                              fillColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title("city"),
                          inputField(
                              cityController, false, mediaquery, "epsum", true),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: mediaquery.height * 0.08),
                  PrimaryButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.pushRoute(MedicalHistory(
                            weight: weightController.text,
                            height: heightController.text,
                            city: cityController.text,
                            state: stateController.text,
                            bloodGroup: bloodGroup));
                      }
                    },
                    buttonText: tr("next"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
    );
  }

  IconButton _backButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.popRoute();
      },
      icon: const Icon(
        Icons.arrow_back,
        size: 25,
        color: Colors.white,
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
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  TextFormField inputField(TextEditingController controller, bool obscureText2,
      Size mediaquery, String hintText2, bool isHalfSized) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText2,
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        focusedBorder: borderRadius(),
        focusedErrorBorder: borderRadius(),
        disabledBorder: borderRadius(),
        enabledBorder: borderRadius(),
        constraints: BoxConstraints(
            maxWidth: mediaquery.width * (isHalfSized ? 0.4 : 0.85),
            maxHeight: 50),
        hintText: hintText2,
        fillColor: Colors.white,
      ),
    );
  }

  OutlineInputBorder borderRadius() {
    return OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(3));
  }

  Future<DateTime?> datePicker(BuildContext context) {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1995),
        lastDate: DateTime.now());
  }
}
