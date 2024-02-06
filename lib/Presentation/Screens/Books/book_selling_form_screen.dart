import 'dart:io';
import 'dart:typed_data';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:book_basket/Constants/colors.dart';
import 'package:book_basket/Presentation/Widgets/primary_button.dart';
import 'package:book_basket/Utility/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:auto_route/auto_route.dart';

@RoutePage()
class BookDetailsFormScreen extends StatefulWidget {
  const BookDetailsFormScreen({Key? key}) : super(key: key);

  @override
  State<BookDetailsFormScreen> createState() => _BookDetailsFormScreenState();
}

class _BookDetailsFormScreenState extends State<BookDetailsFormScreen> {
  // const BookDetailsFormScreen({Key? key}) : super(key: key);
  TextEditingController boookTitleController = TextEditingController();
  TextEditingController productAddressController = TextEditingController();
  TextEditingController productPincodeController = TextEditingController();
  TextEditingController boookSellingPriceController = TextEditingController();
  TextEditingController boookMRPController = TextEditingController();
  TextEditingController boookEditionController = TextEditingController();
  TextEditingController boookAuthorController = TextEditingController();
  TextEditingController boookPublisherController = TextEditingController();
  TextEditingController boookDescController = TextEditingController();
  TextEditingController boookClassController = TextEditingController();
  Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: const Text('Sell'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              // FocusScope.of(context).unfocus();
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Fill the details of your book to be sold:',
                  style: TextStyle(color: Color(0xff3E4A59), fontSize: 14),
                ),
                spaceBetweenTextFields(),
                SizedBox(
                  // width: mq.width * 0.8,
                  child: TextFormField(
                    controller: boookTitleController,
                    validator: nullValidation,
                    decoration: _inputDecoration("Title"),
                  ),
                ),
                spaceBetweenTextFields(),
                SizedBox(
                  // width: mq.width * 0.8,
                  child: TextFormField(
                    controller: boookClassController,
                    validator: nullValidation,
                    decoration: _inputDecoration("Class"),
                  ),
                ),
                spaceBetweenTextFields(),
                SizedBox(
                  // width: mq.width * 0.8,
                  child: TextFormField(
                    controller: boookDescController,
                    maxLines: 3,
                    validator: nullValidation,
                    decoration: _inputDecoration("Description"),
                  ),
                ),
                spaceBetweenTextFields(),
                Row(
                  children: [
                    SizedBox(
                      width: mq.width * 0.4,
                      child: TextFormField(
                        controller: boookPublisherController,
                        validator: nullValidation,
                        decoration: _inputDecoration("Publisher"),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: mq.width * 0.4,
                      child: TextFormField(
                        controller: boookAuthorController,
                        validator: nullValidation,
                        decoration: _inputDecoration("Author"),
                      ),
                    ),
                  ],
                ),
                spaceBetweenTextFields(),
                spaceBetweenTextFields(),
                SizedBox(
                  width: mq.width * 0.6,
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    readOnly: true,
                    onTap: () {
                      // show modelbottom sheet
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
                                      height: mq.height * 0.3,
                                      // decoration: Bo,
                                      child: CupertinoPicker(
                                        backgroundColor: Colors.white,
                                        useMagnifier: true,
                                        itemExtent: 30,
                                        magnification: 1.1,
                                        scrollController:
                                            FixedExtentScrollController(
                                                initialItem: 5),
                                        children: editionList,
                                        onSelectedItemChanged: (value) {
                                          setState(() {
                                            boookEditionController.text = "";
                                            boookEditionController.text =
                                                editionListString[value]
                                                    .toString();
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
                                      buttonText: "Done",
                                      widthSize: mq.width * 0.75,
                                    ),
                                  )
                                ],
                              ));
                    },
                    controller: boookEditionController,
                    validator: nullValidation,
                    decoration: _inputDecoration("Edition"),
                  ),
                ),
                spaceBetweenTextFields(),
                spaceBetweenTextFields(),
                Row(
                  children: [
                    SizedBox(
                      width: mq.width * 0.3,
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: boookMRPController,
                        keyboardType: TextInputType.number,
                        validator: nullValidation,
                        decoration: _inputDecoration("MRP"),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    SizedBox(
                      width: mq.width * 0.3,
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        controller: boookSellingPriceController,
                        validator: nullValidation,
                        decoration: _inputDecoration("Selling Price"),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
                spaceBetweenTextFields(),
                SizedBox(
                  width: mq.width * 0.45,
                  child: TextFormField(
                    // focusNode: ,
                    maxLength: 6,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: productPincodeController,
                    keyboardType: TextInputType.number,
                    validator: nullValidation,
                    decoration: _inputDecoration("Product Pincode"),
                  ),
                ),
                spaceBetweenTextFields(),
                SizedBox(
                  // width: mq.width * 0.8,
                  child: TextFormField(
                    controller: productAddressController,
                    validator: nullValidation,
                    decoration: _inputDecoration("Product Address"),
                  ),
                ),
                spaceBetweenTextFields(),
                const Text(
                  'Upload Image',
                  style: TextStyle(),
                ),
                const SizedBox(height: 5),
                InkWell(
                  onTap: pickImage,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Container(
                          height: mq.height * 0.2,
                          width: mq.width * 0.85,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: Colors.black,
                              )),
                          child: imageBytes == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Upload only JPG & PNG files',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xff839FC0)),
                                    ),
                                    Icon(
                                      Icons.upload_file,
                                      size: 50,
                                    ),
                                    Text(
                                      'Choose file here(max upload 5MB)',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xff839FC0)),
                                    ),
                                  ],
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.memory(
                                    imageBytes!,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                        ),
                        Visibility(
                          visible: imageBytes != null,
                          child: Positioned(
                            right: -5,
                            top: -5,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    imageBytes = null;
                                  });
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  size: 40,
                                  color: Colors.red,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                spaceBetweenTextFields(),
                spaceBetweenTextFields(),
                spaceBetweenTextFields(),
                Row(
                  children: [
                    const Spacer(),
                    PrimaryButton(
                      onPressed: () {
                        // show dialogue
                        if (true) {
                          AwesomeDialog(
                            showCloseIcon: true,
                            dismissOnTouchOutside: false,
                            context: context,
                            dialogType: DialogType.question,
                            animType: AnimType.bottomSlide,
                            title: 'Want to sell this book?',
                            // desc: 'Dialog description here.............',
                            btnOkText: "Sell",
                            btnCancelOnPress: () {
                              Navigator.pop(context);
                            },
                            btnOkOnPress: () {},
                          ).show();
                        }
                      },
                      buttonText: "Sell",
                      widthSize: mq.width * 0.5,
                    ),
                    const Spacer(),
                  ],
                ),
                spaceBetweenTextFields(),
                spaceBetweenTextFields(),
                spaceBetweenTextFields(),
              ],
            ),
          ),
        ),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }

  List<Widget> get editionList {
    return [
      const Text('2000 - 01'),
      const Text('2001 - 02'),
      const Text('2002 - 03'),
      const Text('2004 - 05'),
      const Text('2005 - 06'),
      const Text('2006 - 07'),
      const Text('2007 - 08'),
      const Text('2008 - 09'),
      const Text('2009 - 10'),
      const Text('2010 - 11'),
      const Text('2011 - 12'),
      const Text('2012 - 13'),
      const Text('2013 - 14'),
      const Text('2014 - 15'),
      const Text('2015 - 16'),
      const Text('2016 - 17'),
      const Text('2017 - 18'),
      const Text('2018 - 19'),
      const Text('2019 - 20'),
      const Text('2020 - 21'),
      const Text('2021 - 22'),
      const Text('2022 - 23'),
      const Text('2023 - 24'),
    ];
  }

  List<String> get editionListString {
    return [
      "2000 - 01",
      "2001 - 02",
      "2002 - 03",
      "2004 - 05",
      "2005 - 06",
      "2006 - 07",
      "2007 - 08",
      "2008 - 09",
      "2009 - 10",
      "2010 - 11",
      "2011 - 12",
      "2012 - 13",
      "2013 - 14",
      "2014 - 15",
      "2015 - 16",
      "2016 - 17",
      "2017 - 18",
      "2018 - 19",
      "2019 - 20",
      "2020 - 21",
      "2021 - 22",
      "2022 - 23",
      "2023 - 24"
    ];
  }

  SizedBox spaceBetweenTextFields() => const SizedBox(height: 20);

  InputDecoration _inputDecoration(String labelText2) {
    return InputDecoration(
      labelText: labelText2,
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
    );
  }

  void pickImage() async {
    // show camera option
    if (imageBytes != null) {
      return;
    }
    await showModalBottomSheet(
        context: context,
        // circular shape
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return SafeArea(
            child: SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Choose Image Source',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        // leading: const Icon(Icons.photo_camera),
                        // title: const Text('Camera'),
                        onTap: () async {
                          final image = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          setState(() {
                            imageBytes = File(image!.path).readAsBytesSync();
                          });
                          Navigator.pop(context);
                        },
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.camera,
                                  color: AppColors.primaryColor,
                                  size: 50,
                                )),
                            const Text(
                              'Camera',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        // leading: const Icon(Icons.photo_camera),
                        // title: const Text('Camera'),
                        onTap: () async {
                          final image = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          setState(() {
                            imageBytes = File(image!.path).readAsBytesSync();
                          });
                          Navigator.pop(context);
                        },
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Icon(
                                  Icons.image,
                                  color: AppColors.primaryColor,
                                  size: 50,
                                )),
                            const Text(
                              'Gallery',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });

    // final image = await ImagePicker().pickImage(source: ImageSource.camera);
    // setState(() {
    //   imageBytes = File(image!.path).readAsBytesSync();
    // });
  }
}
