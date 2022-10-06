// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';
import 'dart:typed_data';

import 'package:book_basket/Constants/colors.dart';
import 'package:book_basket/Constants/constants.dart';
import 'package:book_basket/Presentation/Widgets/primary_button.dart';
import 'package:book_basket/Utility/common.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BookDetailsFormScreen extends StatefulWidget {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fill the details of your product to be sold:',
                style: const TextStyle(color: Color(0xff3E4A59), fontSize: 14),
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
              Text(
                'Upload Image',
                style: const TextStyle(),
              ),
              SizedBox(height: 5),
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
                                children: [
                                  Text(
                                    'Upload only JPG & PNG files',
                                    style: const TextStyle(
                                        fontSize: 10, color: Color(0xff839FC0)),
                                  ),
                                  const Icon(
                                    Icons.upload_file,
                                    size: 50,
                                  ),
                                  Text(
                                    'Choose file here(max upload 5MB)',
                                    style: const TextStyle(
                                        fontSize: 10, color: Color(0xff839FC0)),
                                  ),
                                ],
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.memory(
                                  imageBytes!,
                                  fit: BoxFit.cover,
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
              Row(
                children: [
                  const Spacer(),
                  PrimaryButton(
                    onPressed: () {
                      // show dialogue

                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          // title: Text("Show Alert Dialog Box"),
                          content: Text(
                              "Are you sure you want to submit this for sell?"),
                          actions: <Widget>[
                            SecondaryButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              buttonText: "Cancel",
                              widthSize: 70,
                            ),
                            const Spacer(

                            ),
                            PrimaryButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              buttonText: "Sell",
                              widthSize: 70,
                            ),
                          ],
                        ),
                      );
                    },
                    buttonText: "Sell",
                    widthSize: mq.width * 0.5,
                  ),
                  const Spacer(),
                ],
              ),
              spaceBetweenTextFields(),
            ],
          ),
        ),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
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
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      imageBytes = File(image!.path).readAsBytesSync();
    });
  }
}
